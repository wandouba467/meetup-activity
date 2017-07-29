class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to meetups_path
    else
      render :new
    end
  end

  def edit
     @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])

    if @meetup.update(meetup_params)
      redirect_to meetups_path, notice: "Update Success"
    else
      render :edit
    end 
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    flash[:alert] = "Meetup-activity deleted"
    redirect_to meetups_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description)
  end

end
