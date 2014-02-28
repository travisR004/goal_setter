class Goal < ActiveRecord::Base
  validates :title, :details, :user, :pub_priv, presence: true

  include Commentable
  belongs_to :user
end
