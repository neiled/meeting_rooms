class MeetingRoom
  include Mongoid::Document
  include Mongoid::Timestamps # adds automagic fields created_at, updated_at

  field :name, :type => String
  field :location, :type => String
  field :max_people, :type => Integer
end
