class User < ActiveRecord::Base
    has_many :sessions
    has_many :gamestats, through: :sessions
end
