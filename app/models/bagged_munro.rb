class BaggedMunro < ActiveRecord::Base
  belongs_to :user
  belongs_to :munro
end
