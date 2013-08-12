class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  
  #link_to_if @user.url.present?, image_tag("avatars/#{avatar_name(@user)}", class: "avatar"), @user.url
  def avatar
    h.link_to_if model.url.present?, h.image_tag("avatars/#{avatar_name}", class: "avatar"), model.url
  end
  
  def full_name
  #<%= link_to_if @user.url.present?, (@user.full_name.present? ? @user.full_name : @user.email), @user.url %>
    h.link_to_if model.url.present?, (model.full_name.present? ? model.full_name : model.email), model.url
  end
  
  def website
    handle_none(model.url) do
      h.link_to model.url, model.url
    end
  end
  
  def twitter_name
    handle_none(model.twitter_name) do
      h.link_to model.twitter_name, "http://twitter.com/#{model.twitter_name}"
    end
  end
  
  def bio
    handle_none(model.bio) do
      Redcarpet.new(model.bio, :hard_wrap, :filter_html, :autolink).to_html.html_safe
    end
  end
  
    
  def member_since
    model.created_at.strftime("%B %e, %Y")
  end
  
  private
  def avatar_name
    if model.avatar_image_name.present?
      model.avatar_image_name
    else
      "default.png"
    end
  end
  
  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

end
