class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :city, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :number_of_people, presence: true
  validates :number_of_people, numericality: { only_integer: true }
  has_many_attached :photos
end
