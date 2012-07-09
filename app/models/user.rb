class User
  include Mongoid::Document

  belongs_to :office
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :invitations, :class_name => self.class.to_s, :as => :invited_by

  before_create :setup_office

  after_invitation_accepted :change_office_to_invitor

  def change_office_to_invitor
    p "#change_office_to_invitor"
    self.office = User.find(self.invited_by_id).office
    self.save!
    return true
  end

  def setup_office
    self.office = Office.create!
  end

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  ## Database authenticatable
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Invitable
  field :invitation_token,       type: String
  field :invitation_sent_at,     type: DateTime
  field :invitation_accepted_at, type: DateTime
  field :invitation_limit,       type: Integer
  field :invited_by_id,          type: Integer
  field :invited_by_type,        type: String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
end
