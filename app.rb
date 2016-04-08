require 'rubygems'
require 'sinatra'
require 'bigcommerce'
require 'json'
require 'haml' 
require 'pp'

class BigCommerceAPI_Test < Sinatra::Base

    Bigcommerce.configure do |config|
      config.auth = 'legacy'
      config.url = 'https://store-ebb98.mybigcommerce.com/api/v2/'
      config.username = 'Stencil'
      config.api_key = '62edc8aa1cc25be9a2f336b52e408d4a10c1529b'
    end


  get '/' do
   
    # @products = Bigcommerce::Product.all
    # puts @products

    @products = Bigcommerce::Product.all
    puts JSON.pretty_generate(@products)


    erb :index

  end



  get '/orders' do

    @orders = Bigcommerce::Order.all
    puts JSON.pretty_generate(@orders)

    erb :orders

  end



end