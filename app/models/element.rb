class Element < ApplicationRecord
  belongs_to :post
  validates :element_type, inclusion: {in: ['paragraph', 'image', 'video-embed']}

  has_rich_text :content
  has_one_attached :image

  def paragraph?
    self.element_type == 'paragraph'
  end

  def image?
    self.element_type == 'image'
  end

end
