class CommentsController < ApplicationController
	protect_from_forgery except: :new

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build
		@comment.parent_id = params[:parent_id]
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		respond_to do |format|
			if @comment.errors.any?
				@anchor = "comments_form"
				format.html { render 'posts/show' }
				format.js
			else
				format.html do
					flash[:success] = 'Comment posted.'
					redirect_to @post
				end
				format.js
			end
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html do
				flash[:success] = 'Comment deleted.'
				redirect_to post_path(@post)
			end
			format.js
		end
	end

	private

	def comment_params
      params.require(:comment).permit(:name, :text, :parent_id)
  end
end
