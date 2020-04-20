Rails.application.routes.draw do
  devise_for :users
  # rails g deviseコマンドでUserモデルを作成すると自動でルーティングが作成される


  root to:'tweets#index'
  # 最初の画面にルーティングを設定した（よく使う画面であればどこでもいい）
  # root to: 'コントローラ名#アクション名'  (1)
  # root     'コントローラ名#アクション名'  (2)短縮系

  # showアクション追加したらエラーになった
  # 自作アクションsearchを先に読み込むように上に記載したら改善（なぜ？）
  resources :tweets do
    collection do
      get 'search'
    end
  end
  # resources :tweets, only: :index
  # パスの指定「twwets」
  # アクションは「index」
  # 新規画面を追加したい「new」アクション
  # 投稿をテーブルに保存したい「create」アクション
  # 削除機能追加したい「destroy」アクション
  # 編集機能を追加したい「edit」アクション
  # 更新機能を追加したい「update」アクション
  # 詳細画面を追加したい「show」アクション

  # ↓下記にまとめる(7アクション全部実装の為)
  resources :tweets do
    resources :comments, only: :create
    # コメントテーブルのルーティング
    # ネストにする
  end

  resources :users, only: :show
  # マイページの部分
  # 個別のページ（詳細ページ）を表示したい「show」アクション
  

end
