def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end


def permission_check
  if !current_user
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end
