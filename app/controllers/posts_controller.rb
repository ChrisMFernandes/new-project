class PostsController < ApplicationController

  def index 
    @post = Post.all
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id

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
		@post = Post.find(params[:id])
  end
  
  def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to posts_path
  end
  
  def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end


private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
