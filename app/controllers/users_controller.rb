class UsersController < ApplicationController
  #kkmouse_indexはログイン必須
  before_action :authenticate_login!, only: :kkmouse_index
  
  def search
    # where は、条件に合致するオブジェクトを配列として取得します
    @user = User.where(genre: params[:para])
    if @user.length == 0
      @user = User.where(place: params[:para])
    end
    if params[:name].present?
     @user = User.get_by_name params[:name]
     end
  end
  #初期状態(管理者用)
  def kkmouse_index
    @user = User.all
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
  def category
    @user = User.order(name: :desc)
    end
  def showall
    @user = User.find(params[:id])
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
  
  def coupon
   @user = User.find(params[:id])
  end
  def couponall
   @user = User.where.not(coupon: "")
  end
  
  #permitメソッドの引数に指定されたパラメータ以外は、受け取らないようにする
  def user_params
    params.require(:user).permit(:name, :latitude, :longitude, :genre, :address, :tel, :closingday, :time, :airphoto, :airtext, :menuphoto, :menutext, :itioshiphoto, 
    :itioshitext, :coupon, :money, :storeurl, :comment, :feature, :place, :couponurl, :coupon1 ,:coupon2,:coupon3,:Presentation,:Presentation1,:Presentation2,:Presentation3,:use,
    :use1,:use2,:use3)
  end

  #画像アップロード
  #private
  #def user_params
  #  params.require(:user).permit(:name, :email,:password, :password_confirmation, :image, :remember_digest)
  #end
end