require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
DB = PG.connect({:dbname => 'renewfinancial_development'})

get "/" do
  erb :index
end

post "/:import" do
  file = params[:file][:tempfile]

  if File.extname(file) == '.csv'
    data = SmarterCSV.process(file)
  else
    data = SmarterCSV.process(file, {:col_sep => "\t"})
  end

  @revenue = 0

  data.each do |row|
    purchaser = Purchaser.find_or_create_by(:name => row[:purchaser_name])
    merchant = Merchant.find_or_create_by(:name => row[:merchant_name], :address => row[:merchant_address])

    item = merchant.items.find_or_create_by(:description => row[:item_description]) do |item|
      item.price = row[:item_price]
    end

    order = purchaser.orders.create(:purchaser_id => @purchaser_id)
    sold = ItemOrder.create(:item_id => item.id, :order_id => order.id, :item_quantity => row[:purchase_count])
    @revenue += item.price * sold.item_quantity
  end

  erb :upload
end