class SubsController < ApplicationController

    before_action :ensure_logged_in

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update_attributes(subs_param)
            redirect_to sub_url(@sub)
        else
            render :edit
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(subs_param)
        @sub.user_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    private
    def subs_param
        params.require(:sub).permit(:title, :description)
    end
end