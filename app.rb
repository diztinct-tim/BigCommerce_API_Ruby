require 'rubygems'
require 'sinatra'
require 'bigcommerce'
require 'json'
require 'haml' 
require 'pp'
require 'pry'

class BigCommerceAPI_Test < Sinatra::Base

    Bigcommerce.configure do |config|
      config.auth = 'legacy'
      config.url = 'https://store-ebb98.mybigcommerce.com/api/v2/'
      config.username = 'Stencil'
      config.api_key = '62edc8aa1cc25be9a2f336b52e408d4a10c1529b'
    end


  get '/' do

    @products = Bigcommerce::Product.all
    puts JSON.pretty_generate(@products)

    erb :products

  end


  get '/orders' do

    @orders = Bigcommerce::Order.all
    puts JSON.pretty_generate(@orders)

    erb :orders

  end


  get '/product/:product_id/images' do

    id = params[:product_id].to_i
    @product_images = Bigcommerce::ProductImage.all(id)
    puts JSON.pretty_generate(@product_images)

    erb :images

  end



end