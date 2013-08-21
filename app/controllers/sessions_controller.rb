class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:sessions][:email].downcase)
		if user && user.authenticate(params[:sessions][:password])
			sign_in user				# 重新生成记忆权标,只是重新登录时才更新
			redirect_to user    # 到用户页面
		else
			flash.now[:error] = 'Invalid email/password combination'		# 使用now不会永久保持flash
      render 'new'
		end
	end

	def destroy
		sign_out
    redirect_to root_path
	end
end
