class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :purchase_orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]
  attr_accessor :fullname

  belongs_to :department

  has_many :approver_users
  accepts_nested_attributes_for :approver_users, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "phone_number", "provider", "remember_created_at", "reset_password_sent_at", "reset_password_token", "uid", "updated_at","department_id","designation"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["purchase_orders"]
  end


  def fullname
    "#{self.first_name} #{self.last_name}"
  end

end
