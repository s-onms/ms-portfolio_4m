Rails.application.routes.draw do
  devise_for :users
  # rails g deviseコマンドでUserモデルを作成すると自動でルーティングが作成される


  root to:'tweets#index'
  # 最初の画面にルーティングを設定した（よく使う画面であればどこでもいい）
  # root to: 'コントローラ名#アクション名'  (1)
  # root     'コントローラ名#アクション名'  (2)短縮系

  # showアクション追加したらエラーになった
  # 自作アクションを先に読み込むように上に記載したら改善（なぜ？）
  resources :tweets do
    collection do
      get 'search'
    end
  end
  # resources :tweets, only: :index
  # パスの指定「twwets」
  # アクションは「index」

  # resources :tweets, only: [:index, :new]
  # 新規画面を追加したいので「new」アクションを追加する

  # resources :tweets, only: [:index, :new, :create]
  # 投稿をテーブルに保存したいので「create」アクションを追加する

  # resources :tweets, only: [:index, :new, :create, :destroy, :edit, :update ]
  
  # 削除機能追加する為デストロイ追加
  # 編集機能を追加edit
  # 詳細画面update ↓下記にまとめる(7アクション全部実装の為)
  resources :tweets

  # usersコントローラーのshowアクションを動かせるように設定
  # 現在ログイン中のユーザーの投稿のみが表示するマイページの部分
  resources :users, only: :show
end
