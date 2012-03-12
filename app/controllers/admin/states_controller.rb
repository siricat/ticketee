class Admin::StatesController < Admin::BaseController
  
  before_filter :find_state, :only => [:show, :edit, :update, :destroy]
  
  def index
    @states = State.all
  end
  
  def new
    @state = State.new
  end
  
  def show   
  end
  
  def create 
    @state = State.new(params[:state])
    if @state.save
      flash[:notice] = "State has been created."
      redirect_to admin_states_path
    else
      flash[:alert] = "State has not been created."
      render :action => "new"
    end
  end
  
  def edit  
  end
  
  def update
    if @state.update_attributes(params[:state])
      flash[:notice] = "State has been updated."
      redirect_to admin_states_path
    else
      flash[:alert] = "State has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @state.destroy
    flash[:notice] = "The state named #{@state.name} has been deleted."
    redirect_to admin_states_path
  end  
  
  def make_default
    @state = State.find(params[:id])
    @state.default!
    flash[:notice] = "#{@state.name} is now the default state."
    redirect_to admin_states_path
  end
  
  private

  def find_state
    @state = State.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The state you were looking for could not be found."
    redirect_to admin_states_path
  end  
    
end
