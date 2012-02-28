class Project < ActiveRecord::Base
    
  has_many :tickets, :dependent  => :destroy
  validates :name, :presence => true
  
  has_many :permissions, :as => :thing
  scope :readable_by, lambda { |user| 
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  }
  
  def find_project
    @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to projects_path
  end
  
  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end
    
end
