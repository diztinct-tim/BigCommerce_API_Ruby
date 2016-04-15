require 'rubygems'
require 'sinatra'
require 'bigcommerce'
require 'json'
require 'pp'
require 'pry'
require 'securerandom'

class BigCommerceAPI_Test < Sinatra::Base

    # legacy
    Bigcommerce.configure do |config|
      config.auth = 'legacy'
      config.url = 'https://store-ebb98.mybigcommerce.com/api/v2/'
      config.username = 'Stencil'
      config.api_key = '62edc8aa1cc25be9a2f336b52e408d4a10c1529b'
    end

    # Oauth
    # Bigcommerce.configure do |config|
    #   config.store_hash = ENV['BC_STORE_HASH']
    #   config.client_id = ENV['BC_CLIENT_ID']
    #   config.access_token = ENV['BC_ACCESS_TOKEN']
    # end

  get '/' do

    @title = "All Products"
    @products = Bigcommerce::Product.all
    puts JSON.pretty_generate(@products)

    erb :products

  end


  get '/orders' do

    @title = "All Orders"
    @orders = Bigcommerce::Order.all
    puts JSON.pretty_generate(@orders)

    erb :orders

  end

  get '/categories' do

    @title = "All Categories"
    @categories = Bigcommerce::Category.all
    puts JSON.pretty_generate(@categories)

    erb :categories

  end


  get '/product/:product_id/images' do

    @title = "View Photo"
    id = params[:product_id].to_i
    @product_images = Bigcommerce::ProductImage.all(id)
    puts JSON.pretty_generate(@product_images)

    erb :images

  end

  get '/customers' do

    @title = "All Customers"
    @customers = Bigcommerce::Customer.all(page: 1)
    puts JSON.pretty_generate(@customers)

    erb :customers

  end

  get '/store' do

    @title = "Store Info"
    @store = Bigcommerce::StoreInfo.info
    puts JSON.pretty_generate(@store)

    erb :store

  end



end
