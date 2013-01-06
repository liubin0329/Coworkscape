# encoding: utf-8
class Plan < ActiveRecord::Base
  attr_accessible :per, :price, :space_id, :title, :user_id

  belongs_to :space
  belongs_to :user
  PER_TYPES = [
  [ "月", "月" ],
  [ "週", "週" ],
  [ "日", "日" ],
  ["時間", "時間" ]
  ]
end
