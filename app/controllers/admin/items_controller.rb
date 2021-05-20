class Admin::ItemsController < ApplicationController
    
    def new
    end
    
    def index
        @item = Item.all
    end
end
