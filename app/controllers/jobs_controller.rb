class JobsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :set_job, only: %i[ show edit update destroy ]

  
  def index
    @enrollment = Enrollment.new
    @ransack_jobs = Job.ransack(params[:jobs_search], search_key: :jobs_search)
    @jobs = @ransack_jobs.result.includes(:user)
    @pagy, @jobs = pagy(@ransack_jobs.result.includes(:user))
  end

  
  def show
    @enrollment = Enrollment.find(params[:id])
  end

  
  def new
    @job = Job.new
    authorize @job
  end


  def edit
    authorize @job
  end

 
  def create
    @job = Job.new(job_params)
    authorize @job
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @job.update(job_params)
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
      params.require(:job).permit(:title, :description, :address,:language, :japanese, :status, :salary).merge(user_id: current_user.id)
    end
end
