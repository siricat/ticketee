class Comment < ActiveRecord::Base
  
  # this is run before a record is created, but after the validations are run
  # will only be run on objects about to be saved to the db for the first time
  before_create :set_previous_state
  after_create :set_ticket_state
  after_create :creator_watches_ticket
    
  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"
  
  validates :text, :presence => true
  
  delegate :project, :to => :ticket
  
  private
  
    def set_previous_state
      self.previous_state = ticket.state
    end
    
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
    
    def creator_watches_ticket
      ticket.watchers << user
    end
  
end
