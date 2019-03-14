class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :show]
  
    # GET /appointments
    def index
      @appointments = Appointment.all
      render json: @appointments.as_json(only: [:id, :appointment])
    end
  
    # GET /appointments/1
    def show
      render json: @appointment.as_json(only: [:id, :appointment])
    end
  
    # POST /appointments
    def create
      @date = JSON.parse(request.body.read)['appointment']
      @date = Date.parse(@date)
      # @appointment = Appointment.where("appointment like ?", @date).first

      @appointment = Appointment.where(appointment: params[:appointment])

      if @appointment.present?
        render json: {"Message":"Appointmente already exists"}
      else
        @appointment = Appointment.new(appointment: @date)
          if @appointment.save
            render json: @appointment, status: :created, location: @appointment
          else
            render json: @appointment.errors, status: :unprocessable_entity
          end
      end
    end

    # POST /assigndate
    def assignappointment 
      @user = User.find(params[:user_id])
      @appointment = Appointment.where(appointment: params[:appointment]).first

      if @appointment.present?
        if @appointment.users.include?(@user) 
          render json: {"Message":"Already exists user in appointment"}
        else
          @appointment.users << @user
          render json: @appointment.as_json(except: [:user_id]), status: :accepted, location: @appointment
        end
      else
        render json: {"Message":"Appointment does not exist"}
      end
    end

    # POST /unassigndate
    def unassignappointment
      @user = User.find(params[:user_id])
      @appointment = Appointment.where(appointment: params[:appointment]).first
  
      if @appointment.present?
        if @appointment.users.include?(@user) 
          @appointment.users.delete(@user)
          render json: {"Message":"Professor removed from Appointment correctly"}
        else
          render json: {"Message":"Professor does not exist in Appointment"}
        end
      else
        render json: {"Message":"Appointment does not exist in current list"}
      end
    end
  
    # PATCH/PUT /appointments/1
    def update
      @date = JSON.parse(request.body.read)['appointment']
      @date = Date.parse(@date)
      if @appointment.update(appointment: @date)
      #if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /appointments/1
    def destroy
      if @appointment.destroy
        render json: {"Message":"Appointment deleted successfully from current list"}
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      # # Only allow a trusted parameter "white list" through.
      def appointment_params
        params.require(:appointment).permit(:appointment)
      end

end  