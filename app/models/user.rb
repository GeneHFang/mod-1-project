class User < ActiveRecord::Base
    has_many :sessions
    has_many :gamestats, through: :sessions

    def self.formatted_sessions(userID)
        
        Session.where(user_id: userID).each{|session|

            stat = session.gamestat
            puts "Session ID: #{session.id}\nTotal score: #{stat.score}\nGames played: #{stat.times_played}\nComment: #{session.comment}\n#{"="*70}"
            
        }
    end

    def view_specific_session?
        p = TTY::Prompt.new
        ans = p.select("Would you like to view an specific session?", %w(yes no))
        return false if ans == "no"
        true
    end

    def find_session
        p = TTY::Prompt.new
        ans = p.select("Please choose the session ID of the session:", get_sessions_ids)
        session = Session.find(ans)
    end

    def view_session_options
        p = TTY::Prompt.new
        return nil if !view_specific_session? #breaking entire search
        specific_session = find_session

        while true do

            action_for_session= p.select("What would you like to do with this session?",["edit session comment(s)","view individual stats","main menu"])
            
            break if action_for_session == "main menu"
            
            if action_for_session == "edit session comment(s)"
                edit_comment(specific_session) 
            elsif action_for_session == "view individual stats"
                display_ind_stats(specific_session)
            end
        end

    end

    def display_ind_stats(session)
         stats = Gamestat.find(session.gamestat_id)
         puts "\n\n"
         puts ""
    end

    def edit_comment(session)
        p = TTY::Prompt.new
        puts "Type the new comment for session ID: #{session.id}"
        ans = gets.chomp
        Session.update(session.id, comment: ans)
        puts "Comment succesfully updated"
    end

    def get_sessions_ids
        #self.sessions.map{|session| session.id} "Pluck" direct method on ActiveRecord
        self.sessions.pluck(:id)
    end
 
end
