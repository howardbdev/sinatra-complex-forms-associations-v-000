class PetsController < ApplicationController

  get '/' do
    redirect '/pets'
  end

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  get '/pets/:id/edit' do
    @pet = Pet.all[0]
    erb :'pets/edit'
  end

  post '/pets/:id/edit' do
    "finished edit page (show) goes here"
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(params[:owner])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    binding.pry
    @pet = Pet.find_by_id(params[:id])
    @pet.update(params[:pet])
    redirect to "pets/#{@pet.id}"
  end

end
