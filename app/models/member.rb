class Member < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :caf_col_no, :caf_join_date, :cell_phone, :city, :email, :first_name, :home_phone, :last_name, :state, :street_1, :street_2, :work_phone, :zip
end
