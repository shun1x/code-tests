class LibrariesController < ApplicationController
  def show
    @assets = Asset.search(params[:search], current_library.id)
    # library_id: current_library.id
  end

  def index
    @libraries = Library.all
    render layout: "library_dashboard"
  end

  def activity
    @activity = current_library.activities
    @activity = current_library.activities.order(created_at: :desc)

    render partial: "shared/activity_list", layout: false if request.xhr?
  end

  def info
    render layout: false if request.xhr?
  end
end
