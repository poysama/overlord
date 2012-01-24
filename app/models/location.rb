class Location < ActiveRecord::Base
  has_many :servers
end
