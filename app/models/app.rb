class App < ActiveRecord::Base
  has_many :serverappinfos
  has_many :servers, :through => :serverappinfos
  validates_presence_of :name
  validates_uniqueness_of :name
end
