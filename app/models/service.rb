class Service < ActiveRecord::Base
  has_many :serverserviceinfos
  has_many :servers, :through => :serverserviceinfos
  has_many :connections
  validates_presence_of :name
  validates_uniqueness_of :name
end
