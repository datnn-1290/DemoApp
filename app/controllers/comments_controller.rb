class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find params[:user_id]
    if (current_user?(user)) || (current_user.following? user)
      entry = Entry.find params[:entry_id]
      @comment = entry.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        # redirect_to request.referrer
        respond_to do |format|
          format.html{redirect_to request.referrer}
          format.js
        end
      else
        flash[:warning] = "Please try again(Note: comment at least 6 characters)!"
        redirect_to request.referrer
      end
    else
      flash[:warning] = "You have to follow this user"
      redirect_to request.referrer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
