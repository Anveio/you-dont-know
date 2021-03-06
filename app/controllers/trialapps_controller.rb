class TrialappsController < ApplicationController
  before_action :logged_in_user
  before_action :user_has_accepted_terms, only: [:create, :new, :questions]
  before_action :officer_user,            only: [:accept, :reject]
  before_action :admin_user,              only: :destroy
  before_action :correct_user,            only: [:edit, :answer]
  before_action :raider_user,             only: [:show, :index]
  
  def new
    #if current_user.trialapps.exists?
    #  flash[:info] = "Your account has already submitted an application."
    #end
    @trialapp = current_user.trialapps.new
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
  
  def accept
    @trialapp = Trialapp.find(params[:id]).update_attribute(:accepted, true)
    redirect_to :back
  end
  
  def reject
    @trialapp = Trialapp.find(params[:id]).update_attribute(:accepted, false)
    redirect_to :back
  end
  
  def edit
    @trialapp = Trialapp.find(params[:id])
  end
  
  def destroy
    Trialapp.find(params[:id]).destroy
    flash[:success] = "Applicated deleted"
    redirect_to applications_path
  end
  
  def retract
  end
  
  def index
    @trialapps = Trialapp.all.paginate(page: params[:page])
    @user = current_user
  end
  
  def show
    @trialapp = Trialapp.find(params[:id])
  end
  
  def update
    @user = current_user
    @trialapp = Trialapp.find(params[:id])
    if @trialapp.update_attributes(trialapps_params)
        flash[:success] = "Your application has been saved"
        redirect_to user_url(current_user)
    else
      render 'questions'
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
      @trialapp = Trialapp.find(params[:id])
      @user = User.find(@trialapp.user_id)
      redirect_to(root_url) unless (current_user?(@user))
    end
    
    def raider_user
      @user = current_user
      unless (@user.raider? || @user.officer? || @user.admin?)
        flash[:danger] = "You're not authorized to view this page."
        redirect_to(root_url)
      end
    end
    
    def officer_user
      @user = current_user
      unless (@user.officer?)
        redirect_to(root_url) unless current_user.officer? || current_user.admin?
      end
    end
    
    def admin_user
      unless current_user.admin?
        flash[:danger] = "You're not authorized to view this page."
        redirect_to(root_url)
      end
    end
    
    def user_has_accepted_terms
      @user = current_user
      unless @user.terms_of_service?
        flash[:info] = "Please read this page and check the box to start your application."
        redirect_to info_path
      end
    end
end
