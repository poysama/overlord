class Service < ActiveRecord::Base
  has_many :serverserviceinfos
  has_many :servers, :through => :serverserviceinfos
end
