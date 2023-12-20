class TouristsController < ApplicationController
before_action :authenticate_user!

    def index
      @tourists = Tourist.all
      
    end

    def new
        @tourist = Tourist.new
      end

      def show
        @tourist = Tourist.find(params[:id])
        @comments = @tourist.comments
        @comment = Comment.new
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
     
      def edit
        @tourist = Tourist.find(params[:id])
      end
     
      def update
        tourist = Tourist.find(params[:id])
        if tourist.update(tourist_params)
          redirect_to :action => "show", :id => tourist.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tourist = Tourist.find(params[:id])
        tourist.destroy
        redirect_to action: :index
      end

      private
      def tourist_params
        params.require(:tourist).permit(:name, :what, :how, :more, :access, :image, :youtube_url,)
      end

end
