class Program < ActiveRecord::Base
  belongs_to :developer
  validates :developer_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100}
  validates :summary, presence: true, length: { minimum: 10, maximum: 150}
  validates :description, presence: true
end