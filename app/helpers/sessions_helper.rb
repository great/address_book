module SessionsHelper
  def sign_in(member)
    remember_token = Member.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    member.update_attribute(:remember_token, Member.encrypt(remember_token))
    self.current_member = member
  end

  def signed_in?
    !current_member.nil?
  end

  def current_member=(member)
    @current_member = member
  end

  def current_member
    remember_token = Member.encrypt(cookies[:remember_token])
    @current_member ||= Member.find_by(remember_token: remember_token)
  end

  def sign_out
    current_member.update_attribute(:remember_token, Member.encrypt(Member.new_remember_token))
    cookies.delete(:remember_token)
    self.current_member = nil
  end
end
