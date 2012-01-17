class Server < ActiveRecord::Base
  has_many :serverappinfos
  has_many :apps, :through => :serverappinfos
  has_many :serverserviceinfos
  has_many :services, :through => :serverserviceinfos
  has_many :connections

  validates_presence_of :name
  validates_uniqueness_of :name
end
