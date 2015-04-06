class BlogPostController < ApplicationController
  def index
  end

  def new
  end

  def create
  render plain: params[:article].inspect
	end

	def edit
  end

  def show
  end
end
