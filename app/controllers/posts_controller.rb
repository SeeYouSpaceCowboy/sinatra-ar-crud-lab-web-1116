require_relative '../../config/environment'

class PostsController < ApplicationController
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/deleted' do
    erb :deleted
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])

    redirect "/posts"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    
    redirect "/posts/deleted"
  end
end
