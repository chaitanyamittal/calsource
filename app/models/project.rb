class Project < ActiveRecord::Base
	acts_as_commentable
	belongs_to :user
	has_many :users
	validates :name, presence: true, uniqueness: true

end
