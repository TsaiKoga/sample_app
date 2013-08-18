module SessionsHelper
	# After: 找到用户
	# Comment: 虽然一创建用户就生成一个记忆权标，但是你每登录一次，就重新更新一个记忆权标，防止泄漏
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

	def signed_in?
    !current_user.nil?
  end

	def current_user=(user)
    @current_user = user
  end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])		 # 利用加密的找,cookies不管加不加蜜，都看得到.但是不加密，你还必须加密完后才能匹配
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def current_user?(user)
		user == current_user
	end
end
