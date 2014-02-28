class Goal < ActiveRecord::Base
  validates :title, :details, :user, :pub_priv, presence: true

  belongs_to :user

end
