class Gardener < ActiveRecord::Base

    has_many :plants
    has_secure_password
    validates :username, presence: true

end