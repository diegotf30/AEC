module ApplicationHelper
  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end

  def random_button_color
    ['primary', 'success', 'warning', 'info', 'dark', 'secondary', 'teal', 'purple'].sample
  end
end
