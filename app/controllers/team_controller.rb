class TeamController < ApplicationController
  def show
    @team = School.find(params[:id])
  end
end
