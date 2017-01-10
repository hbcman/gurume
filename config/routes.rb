Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :logins, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  get 'login/index'

  get 'login/show'

  get 'shintyakus/index'

  get 'tokusyus/index'
  get 'top/test'
  root "top#index"
  #UsersControllerのshow、new、edit、create、update、destroyそれぞれのActionに対応するルーティングを一括で設定する
  get "users/kkmouse_index"
  get "users/new"
  get "users/search"
  get "users/category"
  get  "shintyakus/index"
  get "whoweare/weare"
  get "whoweare/itlbe"
  get "whoweare/guruguru"

  resources :users
  resources :tokusyus
  resources :shintyakus
  resources :infos
  #以下，お問い合わせForm用
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  #ログイン
  
end