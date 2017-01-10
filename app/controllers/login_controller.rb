class LoginController < ApplicationController
  # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_login!, only: :show
  def index
  end

  def show
  end
end
