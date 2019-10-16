class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception   # CSRF対策(クロスサイトリクエストフォージェリ)
  before_action :authenticate_user!       # 未ログイン時はログインページにリダイレクトするように設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  # ※1
  end
end

# ※1：deviseの初期状態ではサインアップ時にメールアドレスとパスワードのみを受け取るようにストロングパラメーターが設定。
# 追加のパラメーターを許可したい場合は、application_controller.rbにおいてbefore_actionにconfigure_permitted_parametersメソッドを設定。