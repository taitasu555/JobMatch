class JobsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :set_job, only: %i[ show edit update destroy ]

  
  def index
    @enrollment = Enrollment.new
    @ransack_jobs = Job.ransack(params[:jobs_search], search_key: :jobs_search)
    @jobs = @ransack_jobs.result.includes(:user)
    # 最新順に仕事を表示
    @pagy, @jobs = pagy(@ransack_jobs.result.includes(:user).order(created_at: :desc))
  end

  
  def show
    @job = Job.find(params[:id])
    @job_tags = @job.tags 
  end

  
  def new
    @job = current_user.jobs.new 
    @tags= Tag.all
  end


  def edit
    @tag_list = @job.tags.pluck(:tag_name).join(",")
    authorize @job
  end

 
  def create
    @job = current_user.jobs.new(job_params)   
    tag_list = params[:job][:tag_name].split(",")
    authorize @job
    respond_to do |format|
      if @job.save
        @job.save_jobs(tag_list)
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    tag_list = params[:job][:tag_name].split(",")
    respond_to do |format|
      if @job.update(job_params)
        @job.save_jobs(tag_list)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

   
    def job_params
      params.require(:job).permit(:title, :description, :address,:language, :japanese, :status, :salary)
    end

    def tag_params
      params.require(:job).permit(:tag_name)
    end
end
