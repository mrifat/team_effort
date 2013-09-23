class Pledge < ActiveRecord::Base
  validates_presence_of :name, :user_id, :created_by

  belongs_to :user, foreign_key: 'created_by'
  belongs_to :pledgers, foreign_key: 'user_id'
end
