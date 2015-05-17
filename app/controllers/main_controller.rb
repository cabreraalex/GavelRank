class MainController < ApplicationController
    def index
        @events = Event.all;
        if request.post?
          login
        end
    end
    def events
         @events = Event.all;
         if request.post?
           login
        end
    end
    def results
        @events = Event.all;
        if request.post?
           login
        end
    end
    
    def teams
        @teams = School.all;
        if request.post?
            login
        end
    end

    def school
         if request.post?
            login
        end
    end
    
    def about
         if request.post?
            login
        end
    end
    
    def results
         if request.post?
            login
        end
    end
    
    def logout
        session[:team_id]=nil
        redirect_to :action => "index", :controller =>"main"
    end
    
    def register
        if request.post? and params[:team] 
            @team=School.new(team_params_reg) #temp user
            if !@team.email.include? "@"
 	  		    flash[:notice]="Invalid email"
 	  	    	redirect_to :action => "register", :controller =>"main"
 	  		    return 0
 	  	    end
 	  	    if @team.password==nil or @team.password ==""
 	  	        flash[:notice]="Password Can not be blank."
 	  	    	redirect_to :action => "register", :controller =>"main"
 	  	        return 0
 	  	    end
 	  	     if @team.name==nil or @team.name ==""
 	  	        flash[:notice]="Team Name Can not be blank."
 	  	    	redirect_to :action => "register", :controller =>"main"
 	  	        return 0
 	  	    end
 	  	    if (@team.students.to_i == 0) or (!@team.students.to_i.is_a?(Numeric))
 	  	        flash[:notice]="Team needs more students."
 	  	    	redirect_to :action => "register", :controller =>"main"
 	  	        return 0
 	  	    end

 	  	    if @team.password!=params[:team][:password_conf]
 	  	        flash[:notice]="Passwords do not match."
 	  	    	redirect_to :action => "register", :controller =>"main"
 	  	        return 0
 	  	    end
 	  	    @team.score=0
 	 
 	        @team.before_save
            if @team.save
                 flash[:notice] = "Team Created."
              #   MailMan.validate(@user).deliver
                redirect_to :action => "index", :controller =>"main"
            end
        end
    end
    private
        def team_params
            params.require(:school).permit(:name, :password) #YOU MUST SEND a username and a password
        end
        def team_params_reg
            params.require(:team).permit(:name, :location,:email,:password,:students) #YOU MUST SEND a username and a password
        end
        def login
	        if request.post? and params[:school] # if its a post request and its from the user form...
                @team = School.new(team_params) # create a temp user to hold the users params( just easy that way)
              
                team = School.find_by_name(@team.name) #find the user in the database that matches the user name
                if (team and team.password_matches?(@team.password)) #if the user is found and the passwords match and the user has valideated...
                  session[:team_id] = team.id #set cookie to login
                     puts "logged"
                  team.save #I have no clue why i have this here....
                  redirect_to :action => "index" #redirect to challenges page
                else
                  flash[:notice] = "Sorry, no team was found with that username/password combination." #flash dem dat they arent found
                end
            end
    	end
end
