class User < ActiveRecord::Base
    has_many :comicbooks
    validates :firstname, :lastname, :email, :username, :password, presence: true #activerecord validation that will validate form before saving the user. This replaces line 9 in user_controller
    has_secure_password #method from ActiveRecord which will scramble, add "salt", to the passowrd, will need to 'bcrypt' gem file.
end