class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"
    has_many :attendances
    has_many :users, through: :attendances
  
    validates :title, presence: true
    validates :start_datetime, presence: true
    validates :duration, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :price, presence: true
end
