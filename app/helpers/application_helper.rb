module ApplicationHelper
  def get_message_class_by_type(type)
    css_class = case type
                  when 'notice' then 'success'
                  when 'error' then 'danger'
                  else 'info'
                end
    "alert-#{css_class}"
  end
end
