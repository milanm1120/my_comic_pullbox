class User < ActiveRecord::Base
    has_many :comicbooks #class method with an implicit self, additional macro built in
    validates :firstname, :lastname, :email, :username, presence: true #activerecord validation that will validate form before saving the user. This replaces line 9 in user_controller
    validates_uniqueness_of :username, :email
    has_secure_password #method from ActiveRecord which will scramble, add "salt", to the passowrd, will need to 'bcrypt' gem file.
end


