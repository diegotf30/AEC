module ApplicationHelper
  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end
end
