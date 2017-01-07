class TrialappsController < ApplicationController
  before_action :logged_in_user,        only: [:create, :new, :questions, :answers]
  before_action :admin_user,            only: :destroy
  before_action :correct_user,          only: :retract
  
  def new
    #if current_user.trialapps.exists?
    #  flash[:info] = "Your account has already submitted an application"
    #end
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
    @trialapp = current_user.trialapps.first
  end
  
  def answers
    @trialapp = @user.trialapps.update_attributes(trialapps_params)
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
  
  def retract
  end
  
  def update
    @trialapp = current_user.trialapps.last
    if @trialapp.update_attributes(trialapps_params)
        flash[:success] = "Your application has been updated"
        redirect_to root_url
    else
      render 'edit'
    end
  end
  
  private
    def trialapps_params
      params.require(:trialapp).permit(:character_name, 
                                      :server, :character_class, :spec,
                                      :answer_one, :answer_two, :answer_three,
                                      :answer_four)
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
