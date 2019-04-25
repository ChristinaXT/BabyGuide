class ChecklistsController < ApplicationController

  def index
   @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new(user_id: current_user.id)
  end

  def create
    @checklist = Checklist.create(checklist_params)
      if @checklist.save
         redirect_to user_checklist_path(current_user, @checklist)
    else
        render 'new'
      end
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
    params.require(:checklist).permit(:item, :user_id)
 end
end
