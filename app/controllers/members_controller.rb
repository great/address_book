class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end
end
