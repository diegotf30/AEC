class AttendancesController < ApplicationController
  def create
    @attendance = group.latest_or_new_attendance

    respond_to do |format|
      if @attendance.update(attendance_params)
        flash[:success] = 'Asistencia guardada correctamente'
        format.html
        format.js
      else
        flash[:error] = 'Hubo un error al actualizar la asistencia'
        format.html
        format.js { render "flash" }
      end
    end
  end
end
