class Post < ApplicationRecord
  has_one_attached :image

  before_validation :set_no_title

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 15000 }

  belongs_to :user

  private

  def set_no_title
    self.title = 'No Title' if title.blank?
  end
end