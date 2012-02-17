class Contact < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :phone, :presence => true
  
  belongs_to :topic
 
end