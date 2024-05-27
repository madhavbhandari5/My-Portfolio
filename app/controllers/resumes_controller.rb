class ResumesController < ApplicationController
  before_action :set_resume, only: %i[show edit update destroy]
  before_action :require_login, except: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_url, notice: 'Resume was successfully destroyed.'
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:title, :file)
  end

  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end

  def require_admin
    unless current_user.admin?
      redirect_to resumes_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
