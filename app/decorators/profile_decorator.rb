# frozen_string_literal: true

module ProfileDecorator
  def sanitized_description
    markdown = Commonmarker.to_html(description)
    sanitizer.sanitize(markdown).html_safe
  end

  def number_of_friends(friends)
    friends.present? ? "(#{friends.size}人)" : ''
  end

  private def sanitizer
    @sanitizer ||= Rails::Html::SafeListSanitizer.new
  end
end
