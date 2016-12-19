class TokusyusController < ApplicationController
  def index
    @tokusyu = Tokusyu.page(params[:page])
  end
  def show
  end
    # データを作成する画面を表示するためのAction
  def new
     @tokusyu = Tokusyu.new
  end
     # データを更新する画面を表示するためのAction
   def edit
   end
     # データを作成するためのAction
    def create
    @tokusyu = Tokusyu.new(tokusyu_params)
    @tokusyu.save
        redirect_to @tokusyu
    end
     # データを更新するためのAction
    def update
    end
     # データを削除するためのAction
    def destroy
    end
    def tokusyu_params
    params.require(:tokusyu).permit(:id,:title, :date, :comment, :url)
    end
end
