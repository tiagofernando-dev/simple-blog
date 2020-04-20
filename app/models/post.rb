class Post < ApplicationRecord

  scope :with_author, -> (author_id) { where("author_id = ?", author_id) }
  belongs_to :author
  validates :title, presence: true, uniqueness: true
  before_save :set_slug

  def set_slug()
    self.slug = Slug.new(self.title).value
  end

end
