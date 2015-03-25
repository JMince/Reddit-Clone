class CommentsController < ApplicationController
  before_action :find_post_and_user
  before_action :check_user
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

    def new
      @comment = Comment.new
    end


    def create
      @comment = @post.comments.new(comment_params)
      @comment.update_attributes(user_id: @user.id)
      if @comment.save
        redirect_to post_path(@post), notice: "Comment Successfully Created"
      else
        render :new
      end
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
          redirect_to post_path(@post), notice: "Comment Updated Successfully"
        else
          render :edit
        end
      end


    def destroy

    end


  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_post_and_user
    @post = Post.find(params[:post_id])
    @user = User.find(current_user)
  end


  def find_comment
    @comment = Comment.find(params[:id])
  end

  def check_owner
    redirect_to root_path, notice: 'You are not the owner' unless current_user.id != @comment.user_id
  end


end
