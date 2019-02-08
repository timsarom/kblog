class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build
		@comment.parent_id = params[:parent_id]
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.errors.any?
			@anchor = "comments"
			render 'posts/show'
		else
			redirect_to @post
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private

	def comment_params
      params.require(:comment).permit(:name, :text, :parent_id)
  end
end
