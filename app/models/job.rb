class Job < ApplicationRecord

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  has_many :resumes

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
end
