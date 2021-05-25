class Public::HomesController < ApplicationController
  
  def top
    @newitems = Item.order("created_at DESC").limit(4)
  end

  def about
  end
  
end
