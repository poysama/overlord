class Serverappinfo < ActiveRecord::Base
  belongs_to :app
  belongs_to :server
end
