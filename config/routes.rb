Rails.application.routes.draw do
  root "top#index"
  #UsersControllerのshow、new、edit、create、update、destroyそれぞれのActionに対応するルーティングを一括で設定する
  get "users/index"
  resources :users
end