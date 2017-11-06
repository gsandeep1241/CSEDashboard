class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_comment, only: [:destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment successful!"
      redirect_to root_url
    else
      flash[:danger] = "Comment too big or too small!"
      @feed_items = []
      redirect_to root_url
    end
  end
  
  def new
  end
  
  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end
  
  def correct_comment
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
end