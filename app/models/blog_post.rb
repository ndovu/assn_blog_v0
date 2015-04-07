class BlogPost < ActiveRecord::Base
	validates :title, presence: true
  :subtitle
  validates :body, presence: true

  has_many :blog_post_comments, dependent: :nullify

  scope :last_updated_first, -> { order("updated_at DESC") }
end
