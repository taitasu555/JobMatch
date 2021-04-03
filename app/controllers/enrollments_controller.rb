class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ destroy ]

  
  def index
    @enrollment_to = Enrollment.where(to_user_id: current_user.id).all
    @enrollment_from = Enrollment.where(from_user_id: current_user.id).all
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollments_path, notice: "Chat with recruiter was successfully created." }
        format.json { render :show, status: :created, location: @enrollment }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_path, notice: "Enrollment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])#ルーム情報の取得
    @message = Message.new 
    @messages = @enrollment.messages 
    if current_user.has_role?(:user)
      @num = @enrollment.from_user_id
      @user= User.find(@num)
    else
      @num = @enrollment.from_user_id
      @user= User.find(@num)
    end
  end

  private
    
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

   
    def enrollment_params
      params.permit(:job_id, :to_user_id, :from_user_id)
    end
end
