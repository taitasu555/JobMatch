class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pagy::Backend  
  
  # top画面での検索バーの設定
  before_action :set_global_variables
  def set_global_variables
    @ransack_jobs = Job.ransack(params[:jobs_search], search_key: :jobs_search) 
  end

  private

  def user_not_authorized 
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company])
  end

end
