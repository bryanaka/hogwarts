class HousesController < ApplicationController
  def index
    @house = House.all
  end

end