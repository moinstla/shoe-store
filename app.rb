require "bundler/setup"
Bundler.require :default
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb :index
end

get '/stores/add' do
  @stores = Store.all
  erb :add_store
end

post '/stores/add' do
  store_name = params['store-name']
  @store = store_name
  new_store = Store.create({name: store_name})
  redirect "/stores/#{new_store.id}"
end

get '/stores/:id' do
  @store = Store.find(params['id'].to_i)
  @brands = Brand.all
  erb :stores
end

post '/stores/:id/add_brand' do
  @store = Store.find(params['id'].to_i)
  @brand = Brand.find(params['brand_id'].to_i)
  @store.brands.push(@brand)
  @brands = Brand.all
  redirect back
end

get '/stores/:id/edit' do
  erb :edit_store
end

patch '/stores/:id/update' do
  store_id = params['id'].to_i
  store = Store.find(store_id)
  new_name = params['new_name']
  store.update({name: new_name})
  @store = Store.find(store_id)
  redirect back
end

delete '/stores/:id/delete' do
  @store = Store.find(params['id'].to_i)
  @store.delete
  @stores = Store.all
  redirect '/'
end

get '/brands/add' do
  @brands = Brand.all
  erb :add_brand
end

post '/brands/add' do
  brand_name = params['brand-name']
  brand_price = params['brand-price'].to_i
  # @brand = brand_name
  new_brand = Brand.create({name: brand_name,
  price: brand_price})
  redirect "/brands/#{new_brand.id}"
end

get '/brands/:id' do
  @brand = Brand.find(params['id'].to_i)
  @stores = Store.all
  erb :brands
end

post '/brands/:id/add_store' do
  @brand = Brand.find(params['id'].to_i)
  @store = Store.find(params['store_id'].to_i)
  @brand.stores.push(@store)
  @stores = Store.all
  redirect back
end
