class Office
  include Mongoid::Document

  has_many :users

  field :invitation_token, :type => String, :null => false

  before_create :generate_invitation_token

  def generate_invitation_token
    self.invitation_token = SecureRandom.urlsafe_base64
  end
end
