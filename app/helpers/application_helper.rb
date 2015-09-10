module ApplicationHelper
  def gravatar_for(developer, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(developer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: developer.developername, class: "gravatar")
  end
end
