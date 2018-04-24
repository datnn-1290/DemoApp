class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash.now[:success] = "Entry created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content)
  end
end
