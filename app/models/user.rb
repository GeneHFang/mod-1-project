class User < ActiveRecord::Base
    has_many :sessions
    has_many :gamestats, through: :sessions

    def self.formatted_sessions(userID)
        
        Session.where(user_id: userID).each{|session|

            stat = session.gamestat
            puts "Session ID: #{session.id}\nTotal score: #{stat.score}\nGames played: #{stat.times_played}\nComment: #{session.comment}\n#{"="*70}"
            
        }
    end

    def edit_comment
        p = TTY::Prompt.new
        ans = p.select("Would you like to edit any session comment(s)?", %w(yes no))
        return nil if ans == "no"
        ans = p.select("Please choose a session ID to edit comment:", get_sessions_ids)
        session_to_edit = Session.find(ans)
        puts "Type the new comment for session ID: #{ans}"
        ans = gets.chomp
        session_to_edit.update(comment: ans)
        puts "Comment succesfully updated"
    end

    def get_sessions_ids
        self.sessions.map{|session| session.id}
    end
end
