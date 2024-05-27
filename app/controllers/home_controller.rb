class HomeController < ApplicationController
  def index
  end

  def about
    @projects = Project.all
  end

  def contact
  end
end
