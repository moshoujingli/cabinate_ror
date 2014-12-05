class Restaurant < ActiveRecord::Base
    has_many :tableunits
    has_many :products
    validates :name, presence: true, length: { minimum: 3 }

    #0 account turn on
    #1 account deleted forever
    #2 account turn off
    validates :status,inclusion:  { in: [0,1,2] }
end
