module ApplicationHelper
  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end

  def current_member_verified?
    current_member&.verified?
  end

  def random_button_color
    ['primary', 'success', 'warning', 'info', 'dark', 'secondary', 'teal', 'purple'].sample
  end

  def show_path_helper(model)
    eval("#{model.class.name.downcase}_path(#{model.id})")
  end

  def format_phone(phone)
    return '-' unless phone
    number_to_phone(phone, pattern: /(\d{2})(\d{4})(\d{4})$/, area_code: true)
  end

  def day_abbreviation_to_text(day)
    case day
    when 'lun'
      'Lunes'
    when 'mar'
      'Martes'
    when 'mie'
      'Miércoles'
    when 'jue'
      'Jueves'
    when 'vie'
      'Viernes'
    when 'sab'
      'Sábado'
    when 'dom'
      'Domingo'
    end
  end

  def status_in_spanish(status)
    case status
    when 'active'
      'Activo'
    when 'suspended'
      'Suspendido'
    when 'inactive'
      'Inactivo'
    end
  end

  def status_to_color_class(status)
    case status
    when 'active'
      'text-success'
    when 'disabled'
      'text-warning bold'
    when 'inactive'
      'text-danger bold'
    end
  end

  def single_line_flash(type, message)
    concat(content_tag(:div, message, class: "alert alert-#{type}") do 
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            concat message 
          end)
  end
end
