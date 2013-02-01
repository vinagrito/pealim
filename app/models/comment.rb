class Comment < ActiveRecord::Base

  validates_presence_of :author
  validates_presence_of :email
  validates_presence_of :text

  scope :ordered, :order => "created_at DESC"

end
