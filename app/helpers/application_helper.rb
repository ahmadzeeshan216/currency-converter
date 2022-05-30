module ApplicationHelper
  CRUD_ACTIONS = %w(create new edit update)

  CRUD_ACTIONS.each do |action_name|
    define_method "#{action_name}_action?" do
      params[:action] == action_name
    end
  end

  def flash_message_classes(type)
    case type.to_sym
    when :error
      'alert alert-danger'
    when :notice
      'alert alert-info'
    else
      ''
    end
  end

end
