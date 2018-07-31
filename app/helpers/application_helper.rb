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

  def show_path_helper(model)
    eval("#{model.class.name.downcase}_path(#{model.id})")
  end

  def format_phone(phone)
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
    if 'active'
      'text-success'
    elsif 'disabled'
      'text-warning'
    elsif 'inactive'
      'text-danger'
    end
  end
end
