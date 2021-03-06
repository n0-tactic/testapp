# coding: utf-8

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    redirect_to :action => "index"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
    if @post.errors.empty?
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    render_404 unless @post

    @post.destroy
    redirect_to action: :index
  end

end
