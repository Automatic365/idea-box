class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      redirect_to @idea
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

def index
  @ideas = Idea.all
end


private

def idea_params
  params.require(:idea).permit(:name, :description,:user_id, :category_id)
end

end
