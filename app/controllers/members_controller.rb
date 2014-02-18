class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Welcome to the Address Book!"
      redirect_to @member
    else
      render 'new'
    end
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end
end
