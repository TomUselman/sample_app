class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :password, :in => 7..40
  validates_confirmation_of :password, :message => "Doesn't  match Confirmation"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  def self.validate(name, password)
    user = self.where(:name => name, :password => password)
    user.size > 0
  end
end