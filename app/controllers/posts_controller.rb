class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title)) 	# update just the title
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	
	# The require method is the most restrictive. It means that the params that get passed in must contain a key called "post".
	# The permit method is a bit looser. It means that the params hash may have whatever keys are in it.
	# Abstract the strong parameter (for create && update methods) call into its own method && avoid DRY

	# We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action. 
	# This should come after the other methods
	private

	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
