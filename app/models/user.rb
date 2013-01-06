# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :website, :profile
  validates :name,
  :presence => true
  has_many :spaces
  has_many :plans
  has_attached_file :avatar,
  :styles => {
    :small => "300x300#",
    :thumb => "33x33#",
  },
  :storage => :s3,
  :s3_protocol => "https",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :url  => ":s3_domain_url",
  :path => ":attachment/:id/:style.:extension"
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  	data = access_token.extra.raw_info
  	if user = self.find_by_email(data.email)
    	user
  	else # Create a user with a stub password. 
    	self.create!(:email => data.email, :name => data.name, :password => Devise.friendly_token[0,20]) 
  	end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
  
      def self.csv(users)
    require 'csv'
    headers = %w(name mail)
    # force_quotesオプションで全fieldにクオート強制される
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      enum = if users.is_a?(Array)
        # Arrayだったらそのまま
        users.each
      else
        # Relationとかだったらfind_in_batchesで分割して
        Enumerator.new do |yielder|
          users.find_in_batches do |records|
            records.each { |record| yielder.yield record }
          end
        end
      end
      enum.each do |user|
        csv << [
          user.name,
          user.email
        ]
      end
    end
    csv_data.encode(Encoding::SJIS) # sjisにへんかーん
  end
  
end