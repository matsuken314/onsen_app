module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      # ゲストアカウントでログイン
      user = User.guest
      user.skip_confirmation!
      user.save!
      sign_in user
      # トップページへリダイレクト
      redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
    end
  end
end
