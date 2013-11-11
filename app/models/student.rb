class Student < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  belongs_to :house
  before_create :use_sorting_hat!

  # I personally don't like that this is in the model and think the sorting hat may be a service object?
  def use_sorting_hat!
  	self.house = House.all.sample
  end
end