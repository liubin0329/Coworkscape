# encoding: utf-8
class Space < ActiveRecord::Base
  attr_accessible :address1, :address2, :address3, :description, :email, :facebook, :name, :orgnazation, :phone, :pref, :twitter, :user_id, :website, :zip, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :user_id, :created_at, :updated_at, :organization, :twentyfour, :drinks, :pet, :reg, :weekends, :post, :receipt, :conference, :phone_machine, :fax, :printer, :scanner, :shredder, :copy, :locker, :projector, :whiteboard, :charger, :wifi, :latitude, :longitude, :create_address, :plans_attributes, :availability, :photo1, :photo1_file_name, :photo1_content_type, :photo1_file_size, :photo1_updated_at, :photo2, :photo2_file_name, :photo2_content_type, :photo2_file_size, :photo2_updated_at, :photo3, :photo3_file_name, :photo3_content_type, :photo3_file_size, :photo3_updated_at, :oneday, :full_address, :price_notice, :visa
  validates :name, :description, :zip, :pref, :address1, :address2,
  :presence => true
  validates_attachment_presence :photo
  geocoded_by :full_address
  after_validation :geocode, :if => :address2_changed?
  
  belongs_to :user
  has_many :plans, :dependent => :destroy
  accepts_nested_attributes_for :plans, :reject_if => lambda { |a| a[:price].blank? }
  
  has_attached_file :photo,
  :styles => {
    :large => "870×580",
    :small => "300x200#",
  },
  :storage => :s3,
  :s3_protocol => "http",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url  => ":s3_domain_url",
  :path => ":attachment/:id/:style.:extension"
  
  has_attached_file :photo1,
  :styles => {
    :large => "870×580",
    :small => "300x200#",
  },
  :storage => :s3,
  :s3_protocol => "http",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url  => ":s3_domain_url",
  :path => ":attachment/:id/:style.:extension"
  
  has_attached_file :photo2,
  :styles => {
    :large => "870×580",
    :small => "300x200#",
  },
  :storage => :s3,
  :s3_protocol => "http",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url  => ":s3_domain_url",
  :path => ":attachment/:id/:style.:extension"
  
  has_attached_file :photo3,
  :styles => {
    :large => "870×580",
    :small => "300x200#",
  },
  :storage => :s3,
  :s3_protocol => "http",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url  => ":s3_domain_url",
  :path => ":attachment/:id/:style.:extension"  
  searchable do
    text    :name
    text    :description
    text    :organization
    text    :pref
    text    :address1
    text    :address2
    text    :address3
    integer :user_id
   	time    :created_at
   	time    :updated_at
   	boolean :twentyfour
   	boolean :drinks
   	boolean :pet
   	boolean :reg
   	boolean :weekends
   	boolean :post
   	boolean :receipt
   	boolean :conference 
   	boolean :phone_machine
   	boolean :fax
   	boolean :printer
   	boolean :scanner
   	boolean :shredder
   	boolean :copy
   	boolean :locker
   	boolean :projector
   	boolean :whiteboard
   	boolean :charger
   	boolean :wifi
   	boolean :availability
   	boolean :oneday
   	boolean :visa
  end

  CITY_TYPES = [
  [ "北海道", "北海道" ],
  [ "青森県", "青森県" ],
  [ "岩手県", "岩手県" ],
  [ "宮城県", "宮城県" ],
  [ "秋田県", "秋田県" ],
  [ "山形県", "山形県" ],
  [ "福島県", "福島県" ],
  [ "茨城県", "茨城県" ],
  [ "栃木県", "栃木県" ],
  [ "群馬県", "群馬県" ],
  [ "埼玉県", "埼玉県" ],
  [ "千葉県", "千葉県" ],
  [ "東京都", "東京都" ],
  [ "神奈川県", "神奈川県" ],
  [ "新潟県", "新潟県" ],
  [ "富山県", "富山県" ],
  [ "石川県", "石川県" ],
  [ "福井県", "福井県" ],
  [ "山梨県", "山梨県" ],
  [ "長野県", "長野県" ],
  [ "岐阜県", "岐阜県" ],
  [ "静岡県", "静岡県" ],
  [ "愛知県", "愛知県" ],
  [ "三重県", "三重県" ],
  [ "滋賀県", "滋賀県" ],
  [ "京都府", "京都府" ],
  [ "大阪府", "大阪府" ],
  [ "兵庫県", "兵庫県" ],
  [ "奈良県", "奈良県" ],
  [ "和歌山県", "和歌山県" ],
  [ "鳥取県", "鳥取県" ],
  [ "島根県", "島根県" ],
  [ "岡山県", "岡山県" ],
  [ "広島県", "広島県" ],
  [ "山口県", "山口県" ],
  [ "徳島県", "徳島県" ],
  [ "香川県", "香川県" ],
  [ "愛媛県", "愛媛県" ],
  [ "高知県", "高知県" ],
  [ "福岡県", "福岡県" ],
  [ "佐賀県", "佐賀県" ],
  [ "長崎県", "長崎県" ],
  [ "熊本県", "熊本県" ],
  ["大分県", "大分県" ],
  ["宮崎県", "宮崎県" ],
  ["鹿児島県", "鹿児島県" ],
  ["沖縄県", "沖縄県" ]
  ]
  
  def full_address
  [pref,address1,address2].compact.join(',')
  end
  
end