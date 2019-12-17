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

	# def create
	#   # @post = Post.new(params["post"])
	#   @post = Post.new(params.require(:post).permit(:title, :description))
	#   @post.save
	#   redirect_to post_path(@post)
	# end

# 	uses private helper method from below post_params
	def create 
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	end
	  

	# def update
	#   @post = Post.find(params[:id])
	#   # @post.update(params["post"])
	#   @post.update(params.require(:post).permit(:title))
	#   redirect_to post_path(@post)
	# end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end


	def edit
	  @post = Post.find(params[:id])
	end

	private
	 
	def post_params
	  params.require(:post).permit(:title, :description)
	end


end
   
# 	alternative create/update
#	only wanted to permit updates to :title in the update action

# def create
# 	@post = Post.new(post_params(:title, :description))
# 	@post.save
# 	redirect_to post_path(@post)
#   end
   
#   def update
# 	@post = Post.find(params[:id])
# 	@post.update(post_params(:title))
# 	redirect_to post_path(@post)
#   end
   
#   private
   
   
#   # We pass the permitted fields in as *args;
#   # this keeps `post_params` pretty dry while
#   # still allowing slightly different behavior
#   # depending on the controller action. This
#   # should come after the other methods
   
#   def post_params(*args)
# 	params.require(:post).permit(*args)
#   end