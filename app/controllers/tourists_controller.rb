class TouristsController < ApplicationController
before_action :authenticate_user!

    def index
      @tourists = Tourist.all
    end

    def new
        @tourist = Tourist.new
      end
    
      def create
        tourist = Tourist.new(tourist_params)

        tourist.user_id = current_user.id

        if tourist.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @tourist = Tourist.find(params[:id])
      end


      private
      def tourist_params
        params.require(:tourist).permit(:name, :what, :how, :more, :access, :image, :youtube_url)
      end

end
