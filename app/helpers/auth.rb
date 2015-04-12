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

def album_ownership_check(album)
  if album.user_id != current_user.id
    flash[:error] = "Sorry, you do not have permission to see that."
    redirect '/albums'
  end
end
