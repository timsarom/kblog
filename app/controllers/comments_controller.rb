class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.post_id = params[:post_id]

		@comment.save
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy 
		redirect_to @post
	end

	private

	def comment_params
      params.require(:comment).permit(:name, :text)
  end
end
