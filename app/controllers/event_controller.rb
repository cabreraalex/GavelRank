require 'geokit'

class EventController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end
  def create
    if request.post? and params[:event]
      @event=Event.new(event_params) #temp user
 	  	 if @event.name==nil or @event.name ==""
 	  	    flash[:notice]="Event name Can not be blank."
 	  	 	  redirect_to :action => "register", :controller =>"main"
 	  	    return 0
 	  	 end
 	  	  if @event.date==nil or @event.date ==""
 	  	    flash[:notice]="Date Can not be blank."
 	  	 	  redirect_to :action => "register", :controller =>"main"
 	  	    return 0
 	  	 end
 	  	 @event.location = "#{current_user.name} #{current_user.location}"
 	  	 z= Geokit::Geocoders::MultiGeocoder.geocode(location)
 	  	 @event.geo = z.ll#do this
 	  	 @event.best=0
 	  	 @event.outstanding=0
 	  	 @event.honorable=0
 	  	 months = {"January"=>"01","February"=>"02","March"=>"02","April"=>"04","May"=>"05","June"=>"06","July"=>"07","August"=>"08","September"=>"09","October"=>"10","November"=>"11","December"=>"12"}
 	  	 @event.date = "#{months[@event.date.split(' ')[0]]} #{@event.date}"
 	  	 if @event.save
                 flash[:notice] = "Event Created."

                redirect_to :action => "index", :controller =>"main"
            end
    end
  end
  
  private 
     def event_params
            params.require(:event).permit(:name, :date) 
        end
        def current_user
       @current_user ||= School.find(session[:team_id]) if session[:team_id]
    end
  
end
