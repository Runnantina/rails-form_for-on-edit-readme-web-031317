class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		# redirect_to post_path(@post)
	end

	def new
		@post = Post.new
	end

	def create
	
    @post = Post.new(post_params)
      if @post.save
        redirect_to post_path(@post)
			else
				redirect_to post_path(@post)
      end
  end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
	  @post.update(params.require(:post))
	  redirect_to post_path(@post)
	end

	private

	def post_params
    params.permit('title', "description") #need to add current user
  end
end
