class ChecklistsController < ApplicationController

  def index
   @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new(user_id: current_user.id)
  end

  def create
    @checklist = Checklist.new(checklist_params)
      if @checklist.save
         redirect_to user_checklist_path(current_user, @checklist)
    else
        flash[:notice] = "Your checklist creation was unsuccessful"
        render 'new'
      end
  end

  #scope method
 def users_with_most_requests
   @checklists = Checklist.users_with_most_requests
   #@recent_checklists = Checklist.most_recent(5)
 end

def requests_untaken
  @checklists = Checklist.requests_untaken
end

 def show
    @checklist = Checklist.find_by(id: params[:id])
 end

 def edit
   @checklist = Checklist.find_by(id: params[:id])
 end

 def update
   @checklist = Checklist.find_by(id: params[:id])
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist)
   else
       flash[:notice] = "Something went wrong, please try again"
       render 'edit'
    end
 end

  def destroy
    checklist = Checklist.find_by(id: params[:id])
    checklist.destroy
    redirect_to user_path(current_user)
  end

    private

 def checklist_params
    params.require(:checklist).permit(
      :item,
      :user_id
    )
 end
end
