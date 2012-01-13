class Serverserviceinfo < ActiveRecord::Base
  belongs_to :server
  belongs_to :service
end
