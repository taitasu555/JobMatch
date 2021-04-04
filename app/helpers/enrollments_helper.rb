module EnrollmentsHelper
  def enrollment_button(user, job)
     if user_signed_in? 
       if current_user.has_role?(:user) 
        if job.enrollments.where(to_user_id: user.id).any? 
            "you already applied this job"
        else
            link_to "Apply", enrollments_path(job_id: job.id, to_user_id: current_user.id, from_user_id: job.user.id), method: :post  
        end 
       end 
      end 
  end
end
