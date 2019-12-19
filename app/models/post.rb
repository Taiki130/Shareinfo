# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  before_validation :set_no_title

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: false, length: { maximum: 15000 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  private

  def set_no_title
    self.title = 'No Title' if title.blank?
  end
end
