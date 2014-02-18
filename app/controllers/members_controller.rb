class MembersController < ApplicationController
  before_action :signed_in_member, only: [:edit, :update]
  before_action :correct_member,   only: [:edit, :update]

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      sign_in @member
      flash[:success] = 'Welcome to the Address Book!'
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = 'Profile updated'
      redirect_to @member
    else
      render 'edit'
    end
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end

  # Before filters

  def signed_in_member
    # around Figure 9.6: what is signin_url?
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_member
    @member = Member.find(params[:id])
    redirect_to(root_url) unless current_member?(@member)
  end
end
