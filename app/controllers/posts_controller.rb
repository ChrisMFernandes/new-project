class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  def index 
    @posts = Post.all.order('created_at DESC')
  end

  def new 
    @post = Post.new
  end

  def show
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.author = current_user.email

    respond_to do |format|
      if @post.save
          format.html { redirect_to posts_path, notice: 'Post was successfully created, yo!' }
          format.json { render :index, status: :created, location: posts_path }
          format.js
      else
          format.html { render :new, notice: 'Post failed, yo!' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
          format.js
      end
    end
  end

  def edit
  end
  
  def update
		@post.update(post_params)
		redirect_to posts_path
  end
  
  def destroy
		@post.destroy
		redirect_to posts_path
	end


private

    def post_params
      params.require(:post).permit(:title, :body, :author, :user_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
