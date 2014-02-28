class GoalsController < ApplicationController
  before_action :require_logged_in, except: [:index]
  before_action :get_goal, except: [:index, :new, :create, :complete]

  def new
    @goal = Goal.new
  end

  def complete
    @goal = Goal.find(params[:goal_id])
    @goal.completed = true
    redirect_to user_goal_url(current_user.id, @goal)
  end

  def show
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to user_goal_url(current_user.id, @goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update_attributes(goal_params)
      redirect_to user_goal_url(current_user.id, @goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def index
    @goals = Goal.all.where("pub_priv = ? or user_id = ? ", "Public", current_user.id)
  end

  def destroy
    @goal.destroy
    redirect_to root_url
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :details, :pub_priv)
  end

  def get_goal
    @goal = Goal.find(params[:id])
  end
end
