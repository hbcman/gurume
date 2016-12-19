class UsersController < ApplicationController
  def search
    # where は、条件に合致するオブジェクトを配列として取得します
    @users = User.where(genre: params[:para])
  end
  #初期状態(管理者用)
  def kkmouse_index
    @users = User.all
  end
  #データを閲覧する画面を表示するためのAction
  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.json({name: place.name})
    end
  end
  #データを作成する画面を表示するためのAction
  def new
    @user = User.new
  end
  #データを更新する画面を表示するためのAction
  def edit
    @user = User.find(params[:id])
  end
  #データを作成するためのAction
  def create
    #UserというModelの引数にuser_paramメソッドを渡し、新たなユーザ情報を作成
    @user = User.new(user_params)
    
    #@user = User.new(user_params)に対して、saveメソッドで登録処理
    @user.save
    
    #redirect_toメソッドは、引数である@userに格納された情報を参照するページを描画する処理
    redirect_to @user
  end
  #データを更新するためのAction
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end
  #データを削除するためのAction
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #indexというActionが実行される
    redirect_to "/users/kkmouse_index"
  end
  
  #permitメソッドの引数に指定されたパラメータ以外は、受け取らないようにする
  def user_params
    params.require(:user).permit(:name, :latitude, :longitude, :genre, :address, :tel, :closingday, :time, :airphoto, :airtext, :menuphoto, :menutext, :itioshiphoto, :itioshitext, :coupon, :money, :storeurl, :comment, :feature)
  end
  
end
