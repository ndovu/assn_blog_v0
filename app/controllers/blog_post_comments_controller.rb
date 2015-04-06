class BlogPostCommentsController < ApplicationController
	def create
	  # just used to show what params have been passed. shown in the browser
	  # render text: params
	  @blog_post = BlogPost.find(params[:blog_post_id])
	  @blog_post_comment = BlogPostComment.new comment_params
	  @blog_post_comment.blog_post = @blog_post
	  if @blog_post_comment.save
	  	redirect_to blog_post_path(@blog_post)
	  else
	  	render 'blog_posts/show'
	  end
	end

	private

	def comment_params
  	params.require(:blog_post_comment).permit(:title, :body)
	end
end
