class App < ActiveRecord::Base
  has_many :serverappinfos
  has_many :servers, :through => :serverappinfos
end
