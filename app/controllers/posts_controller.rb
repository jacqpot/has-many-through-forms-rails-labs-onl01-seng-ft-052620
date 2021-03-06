class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @commenters = []
    @post.comments.each do |comment|
      @commenters << comment.user if !@commenters.include?(comment.user)

    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [], categories_attributes: [:name], comment_content: [])
  end
end
