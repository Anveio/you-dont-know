class TrialappsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :admin_user,     only: [:destroy]
  
  
  def new
    @trialapp = Trialapp.new
  end
  
  def create
    @trialapp = current_user.trialapps.build(trialapps_params)
    if @trialapp.save
      flash[:success] = "Information saved!"
      redirect_to questions_path
    else
      render 'new'
    end
  end
  
  def questions
    
  end
  
  def answers
    @trialapp = current_user.trialapps.update_attr(trialapps_params)
    if @trialapp.save
      flash[:success] = "Information saved!"
      redirect_to root_url
    else
      render 'questions'
    end
  end

  def reject
  end
  
  def accept
  end
  
  def destroy
  end
  
  private
    def trialapps_params
      params.require(:trialapp).permit(:character_name, 
                                      :server, :character_class, :spec,
                                      :question_one, :question_two, 
                                      :question_three, :question_four, )
    end
    
    # Before filters
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
