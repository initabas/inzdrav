module CommentsHelper
  def nested_comments(comments, commentable)
    comments.map do |comment, sub_comments|
	    nested_comment = "nested_comment" if comment.parent
      content_tag(:div, render(:partial => comment, :locals => {:helpful => commentable}), :class => nested_comment, :id => "comment-" + comment.id.to_s)
    end.join.html_safe
  end
end
