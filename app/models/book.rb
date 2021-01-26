class Book < ApplicationRecord

  validates :title, presence: true
	validates :title, length: {minimum: 1}
	validates :title, length: {maximum: 200}
	validates :body, presence: true
	validates :body, length: {minimum: 1}
	validates :body, length: {maximum: 200}

  belongs_to :user
end
