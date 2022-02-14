class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    redirect_to root_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
  end

  def create
    super 
    #WelcomeMailerクラスのsend_when_signupメソッドを呼び、POSTから受け取ったuserのemailとnameを渡す
    WelcomeMailer.send_change_pass(params[:user][:email],params[:user][:name]).deliver
  flash[:alert] = "パスワード再設定用のリンクを入力されたメールアドレスに送信しました"
  end

  protected
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(_resource)
    user_path(current_user.id)
  end
end
