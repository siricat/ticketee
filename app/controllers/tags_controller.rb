class TagsController < ApplicationController
  
  def remove
    @ticket = Ticket.find(params[:ticket_id])
    if can?(:tag, @ticket.project) || current_user.admin?
      @tag = Tag.find(params[:id])
      #this removes the tag from the ticket but will not delete it from the db
      @ticket.tags -= [@tag]
      @ticket.save
    end
  end
  
end
