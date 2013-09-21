class Effort < ActiveRecord::Base
  validates_presence_of :name, :user_id, :created_by

  belongs_to :user, column: 'created_by'
  belongs_to :pledgers, column: 'user_id'
end
