Rails.application.routes.draw do
  root to:'tweets#new'

  # resources :tweets, only: :index
  # パスの指定「twwets」
  # アクションは「index」

  # resources :tweets, only: [:index, :new]
  # 新規画面を追加したいので「new」アクションを追加する

  # resources :tweets, only: [:index, :new, :create]
  # 投稿をテーブルに保存したいので「create」アクションを追加する

  resources :tweets, only: [:index, :new, :create, :destroy]
  # 削除機能追加する為デストロイ追加
  resources :tweets do
    collection do
      get 'search'
    end
  end
end
