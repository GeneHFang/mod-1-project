class User < ActiveRecord::Base
    has_many :sessions
    has_many :gamestats, through: :sessions

    def formatted_sessions
        num = 1
        self.sessions.each{|session|
            stat = session.gamestat
            puts "#{num}. total score: #{stat.score} \n
            games played: #{stat.times_played}\n
            comment: #{session.comment}\n
            #{"="*70}"
        }
    end
end
