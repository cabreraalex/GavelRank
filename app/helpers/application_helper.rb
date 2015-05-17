module ApplicationHelper
   def current_user
       @current_user ||= School.find(session[:team_id]) if session[:team_id]
    end
end
