class Admin::ItemsController < ApplicationController

    def new
        @item = Item.new
        @genre = Genre.all
    end

    def index
        @item = Item.all
        # @genre = Genre.find(params[:id])
    end

    def show
        @item = Item.find(params[:id])
        @genre = Genre.find(params[:id])
    end

    def edit
        @item= Item.find(params[:id])
        @genre = Genre.all
    end

    def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to admin_item_path(@item.id)
        else
          render "new"
        end
    end

    def update
         @item = Item.find(params[:id])
        if @item.update(item_params)
          redirect_to admin_item_path(@item.id)
        else
          render "edit"
        end
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :price, :is_active, :image, :genre_id)
    end
end
