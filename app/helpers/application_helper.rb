module ApplicationHelper
  def tweet_body(body)
    body ||= ''
    body.gsub!(/#([^\ \n]+)/, %(<a href="/tweets?tag=\\1">#\\1</a>))
    body.gsub!(/@([^\ \n]+)/, %(<a href="/users/\\1">@\\1</a>))
    raw(body)
  end
end
