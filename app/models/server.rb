class Server < ActiveRecord::Base
  has_many :serverappinfos
  has_many :apps, :through => :serverappinfos
  has_many :serverserviceinfos
  has_many :services, :through => :serverserviceinfos
end
