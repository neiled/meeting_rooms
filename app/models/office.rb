class Office
  include Mongoid::Document

  has_many :users
end
