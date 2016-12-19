class ShintyakusController < ApplicationController
  def index
    @shintyaku = Shintyaku.page(params[:page])
  end
  def show
    @shintyaku = Shintyaku.all
  end
    # データを作成する画面を表示するためのAction
  def new
     @shintyaku = Shintyaku.new
  end
     # データを更新する画面を表示するためのAction
   def edit
     @shintyaku = Shintyaku.find(params[:id])
   end
     # データを作成するためのAction
    def create
    @shintyaku = Shintyaku.new(shintyaku_params)
    @shintyaku.save
        redirect_to @shintyaku
    end
     # データを更新するためのAction
    def update
      @shintyaku = Shintyaku.find(params[:id])
      @shintyaku.update_attributes(shintyaku_params)
      redirect_to @shintyaku
    end
     # データを削除するためのAction
    def destroy
      
    @shintyaku = Shintyaku.find(params[:id])
    @shintyaku.destroy
    redirect_to shintyakus_path
    end
    def shintyaku_params
    params.require(:shintyaku).permit(:shopname, :title, :date, :comment)
    end
    
end
