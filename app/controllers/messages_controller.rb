
class MessagesController < ApplicationController

  def create
    @enrollment = Enrollment.find(params[:enrollment_id])
    @message = Message.new(message_params)
    #メッセージがuserによるものだったらis_user=true, shopによるものだったらis_user=false
    if current_user.has_role?(:user)
      @message.is_user = true
    elsif current_user.has_role?(:recruiter)
      @message.is_user = false
    end
    @message.enrollment_id = @enrollment.id
    if @message.save
      redirect_to enrollment_url(@enrollment)
    else
      redirect_to enrollment_url(@enrollment)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
