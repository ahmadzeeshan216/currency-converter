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

  def currency_dropdown(form, type)
    form.select type, options_for_select(
                        CurrencyConversion::AVAILABLE_CURRENCIES,
                        selected: @currency_conversion.send(type)
                      ),
                      { prompt: 'Select Currrency' },
                      { class: 'form-select', required: true }
  end
end
