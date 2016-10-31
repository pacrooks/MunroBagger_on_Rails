class Munro < ActiveRecord::Base
  has_one :forcast
  has_many :bagged_munros
end
