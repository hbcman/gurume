class TopController < ApplicationController
   def index
    @tokusyu = Tokusyu.order(created_at: :desc)
    @shintyaku = Shintyaku.where(date: Date.today)
   end
   
end
