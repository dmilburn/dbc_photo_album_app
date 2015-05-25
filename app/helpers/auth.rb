def current_user
  User.find(session[:user_id])
end


def privacy_guard(album)
  if !album.public && !album_owner?(album)
    flash[:error] = "Sorry, you do not have permission to see that."
    redirect '/'
  end
end

def album_owner_guard(album)
  if !album_owner?(album)
    flash[:error] = "Sorry, you do not have permission to see that."
    redirect '/'
  end
end


def album_owner?(album)
  current_user && album.user_id == current_user.id
end


def empty_sign_up_field?(user_params)
  user_params.each_value do |param|
    return true if param == ""
  end
  return false
end
