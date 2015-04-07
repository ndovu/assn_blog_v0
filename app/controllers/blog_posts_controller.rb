class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.last_updated_first
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(params.require(:blog_post).permit(:title, :subtitle, :body))
    if @blog_post.save
      redirect_to blog_posts_index_path
    else
      render :new
    end
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    @blog_post_comment = BlogPostComment.new
    @blog_post_comments = @blog_post.blog_post_comments.all
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(params.require(:blog_post).permit(:title, :subtitle, :body))
      redirect_to blog_posts_index_path
    else
      render :edit
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to blog_posts_index_path
  end

end
