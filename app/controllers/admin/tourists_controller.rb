class Admin::TouristsController < ApplicationController

    before_action :if_not_admin
    before_action :set_tourist, only: [:destroy, :edit]

    def destroy
        tourist = Tourist.find(params[:id])
        tourist.destroy
        redirect_to tourists_path
    end   

    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end

    def set_tourist
        @tourist = Tourist.new
    end

    def tourist_params
        params.require(:tourist).permit(:name, :what, :how, :more, :access, :image, :youtube_url,) 
    end
end
