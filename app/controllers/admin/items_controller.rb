class Admin::ItemsController < ApplicationController

    def new
        @item = Item.new
        # @genre = Item.genre
    end

    def index
        @item = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item= Item.find(params[:id])
    end

    def create
        @item = Item.new(book_params)
        if @item.save
          redirect_to admin_item_path(@item.id), notice: 'You have created book successfully'
        else
          render "new"
        end
    end

    def update
         @item = Item.find(params[:id])
        if @item.update(item_params)
          redirect_to admin_item_path(@item.id), notice: 'You have updated user successfully.'
        else
          render "edit"
        end
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :price, :is_active)
    end
end
