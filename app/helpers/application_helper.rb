module ApplicationHelper
  def nav_active_css(controller_name, action_name)
    return "active" if params[:controller] == controller_name && params[:action] == action_name
  end

  def format_datetime(time, options = {})
    options[:format] ||= :default
    I18n.l(time, options)
  rescue I18n::ArgumentError
    ''
  end

end
