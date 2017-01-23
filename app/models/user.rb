class User < ActiveRecord::Base
    # ユーザー名による絞り込み
scope :get_by_name, ->(name){
where("name like ?", "%#{name}%")
}
end