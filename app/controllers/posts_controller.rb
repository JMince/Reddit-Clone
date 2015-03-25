class PostsController < ApplicationController

def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)
  if post.save
    redirect_to post_path(@post), notice: "Your post was successfully created"
  else
    render :new
  end
end


private

def post_params
  params.require(:post).permit(:tile, :content)

end

end
