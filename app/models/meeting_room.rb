class MeetingRoom
  include Mongoid::Document
  include Mongoid::Timestamps # adds automagic fields created_at, updated_at

  attr_accessible :name, :location_description, :max_people

  field :name, :type => String
  field :location_description, :type => String
  field :max_people, :type => Integer

  validates_presence_of :name, :location_description, :max_people
end
