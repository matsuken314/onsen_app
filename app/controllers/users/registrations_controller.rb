module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy]

    def after_sign_up_path_for(_resource)
      root_path
    end

    def ensure_normal_user
      redirect_to root_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
    end

    # def create
    #  super
    # WelcomeMailerクラスのsend_welcomeメソッドを呼び、POSTから受け取ったuserのemailとnameを渡す

    # WelcomeMailer.send_welcome(params[:user][:email], params[:user][:name]).deliver
    # binding.pry
    # flash[:alert] = "入力されたメールアドレスに会員登録完了のメッセージを送信しました"
    #  end

    protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

    def after_update_path_for(_resource)
      user_path(current_user.id)
    end
  end
end
