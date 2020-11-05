module ApplicationHelper

  def home_nav_link(page)
    if page.eql?('home')
      link_to('Home', root_path, class: 'menu-item menu-item-selected')
    else
      link_to('Home', root_path, class: 'menu-item')
    end 
  end

  def profile_nav_link(page)
    if page.eql?('profile')
      link_to('Profile', user_path(session[:user_id]), class: 'menu-item menu-item-selected')
    else
      link_to('Profile', user_path(session[:user_id]), class: 'menu-item')
    end 
  end

  def people_nav_link(page)
    if page.eql?('people')
      link_to('People', users_path, class: 'menu-item menu-item-selected')
    else
      link_to('People', users_path, class: 'menu-item')
    end 
  end

  def current_user
    User.find(session[:user_id])
  end

  def user_signed_in?
    true if session[:user_id]
  end

  def current_user_is_author?(opinion)
    opinion.AuthorId == session[:user_id]
  end

  def avatar_url(email)
    if email == nil or email.empty?
      "default_avatar.jpg"
    else
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end

  def cover_image_url(link)
    if link == nil or link.empty?
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ_9hWwp_Cwja6q3mq_WPDmJoSI4NEnHDaqKg&usqp=CAU'
    else
      link
    end
  end

  def following?(user)
    current_user.following.include?(user)
  end

  def liking?(opinion)
    current_user.liked_opinions.include?(opinion)
  end
end
