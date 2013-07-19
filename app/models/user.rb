require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

 def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email,password)
    user = self.where(email: email)[0]

    if user
      if user.password == password
        return user
      end
    end

    return nil

  end
end
