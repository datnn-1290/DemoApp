class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @entry = current_user.entries.build
    @comment = current_user.comments.build
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 2)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
