class ApplicationController < ActionController::Base
# 基本コントローラーは一つでいいが、機能が増えたらコントローラーを追加することが可能

# basic認証を追加。本番環境なら実行するという条件（if: :production?）を追記してデプロイ時だけに働くようにする
# before_action :basic_auth
before_action :basic_auth, if: :production?


before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  private

  # basic認証をデプロイ時に限定するために追記
  def production?
    Rails.env.production?
  end

  # basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      # 直接ログインID,PWはセキュリティーの観点から環境変数で設定して上記に変更する（環境変数使わなければここに入力するれば実装は可）

    end
  end

end


