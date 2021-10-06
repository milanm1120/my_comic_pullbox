class User < ActiveRecord::Base
    has_many :comicbooks
    has_secure_password #method from ActiveRecord which will scramble, add "salt", to the passowrd, will need to 'bcrypt' gem file.
end