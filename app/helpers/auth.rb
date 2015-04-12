def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end


def permission_check(album)
  if !album.public && (!current_user || album.user_id != current_user.id)
    flash[:error] = "Sorry, you do not have permission to see that."
    redirect '/'
  end
end

def album_ownership_check(album)
  if !current_user || album.user_id != current_user.id
    flash[:error] = "Sorry, you do not have permission to see that."
    redirect '/'
  end
end
