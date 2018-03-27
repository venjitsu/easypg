class CurrentServicesController < ApplicationController

  def update
    current_user.current_service = params[:current_service]

    respond_to do |format|
      if current_user.save
        format.html 
      end
    end

  end

  def current_services_params
    params.require(:current_service).permit( :current_service )
  end

end
