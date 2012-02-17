module ApplicationHelper
  def root_controller?
    unless params[:controller].eql?('homepage') && params[:action].eql?("show")
      return "small-background"
    else
      return ""
    end
  end
end
