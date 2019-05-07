class User < ApplicationRecord

    #relationship
    has_one :team

    #validate presence/cannot be blank for fields
    validates_presence_of :first_name, message: "First name can't be blank "
    validates_presence_of :last_name, message: "Last name can't be blank "

    validate :unique_name
    def unique_name
      if (!first_name.nil? && !last_name.blank?)

        @check_users = User.where("first_name =? and last_name = ?", first_name, last_name).first

        if (!@check_users.nil? && !@check_users.blank?)
            errors.add(:first_name,"First name and Last name already exists")
            errors.add(:last_name,"First name and Last name already exists")
        end
      end
    end

end
