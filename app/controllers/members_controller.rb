class MembersController < ApplicationController
  before_action :signed_in_member, only: [:index, :edit, :update, :destroy]
  before_action :correct_member,   only: [:edit, :update]
  before_action :admin_member,     only: :destroy

  def index
    @members = Member.paginate(page: params[:page])
  end

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

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = 'Member deleted.'
    redirect_to members_url
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end

  # Before filters

  def signed_in_member
    unless signed_in?
      store_location
      # around Figure 9.6: what is signin_url?
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  end

  def correct_member
    @member = Member.find(params[:id])
    redirect_to(root_url) unless current_member?(@member)
  end

  def admin_member
    redirect_to(root_url) unless current_member.admin?
  end
end
