Rails.application.routes.draw do
  devise_for :users
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
  resources :users
  resources :tokusyus
  resources :shintyakus
  #以下，お問い合わせForm用
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end