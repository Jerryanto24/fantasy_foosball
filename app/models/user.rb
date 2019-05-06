class User < ApplicationRecord

    #validate presence/cannot be blank for fields
    validates_presence_of :first_name, message: "First name can't be blank "
    validates_presence_of :last_name, message: "Last name can't be blank "

end
