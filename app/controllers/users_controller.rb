class UsersController < ApplicationController
  #初期表示(usersテーブルに登録されたお店一覧を表示)
  def index
    @users = User.all
  end
  #管理者のためのindexページ
  def kkmouse_index
    @user = User.all
  end
  #データを閲覧する画面を表示するためのAction(indexページ ( お店一覧 ) から、お店を選択した際に表示)
  def show
    #idでお店を指定
    @user = User.find(params[:id])
  end
  #データを作成する画面を表示するためのAction
  def new
    @user = User.new
  end
  #データを更新する画面を表示するためのAction
  def edit
  end
  #データを作成するためのAction
  def create
    #UserというModelの引数にuser_paramメソッドを渡し、お店情報を作成
    @user = User.new(user_params)
    
    #@user = User.new(user_params)に対して、saveメソッドで登録処理
    @user.save
    
    #redirect_toメソッドは、引数である@userに格納された情報を参照するページを描画する処理
    redirect_to @user
  end
  #データを更新するためのAction
  def update
  end
  #データを削除するためのAction
  def destroy 
  end
  
  #permitメソッドの引数に指定されたパラメータ以外は、受け取らないようにする
  #つまり、name,address,tel,storeurl,comment以外の情報が送信されてきた場合は受け取らない
  def user_params
    params.require(:user).permit(:name, :address, :tel, :storeurl, :comment)
  end
end
