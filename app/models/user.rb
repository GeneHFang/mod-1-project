class User < ActiveRecord::Base
    has_many :sessions
    has_many :gamestats, through: :sessions

    def print_break
        puts "="*70
    end

    def self.formatted_sessions(userID)
        temp = Session.where(user_id: userID)
        temp.each{|session|
            stat = session.gamestat
            puts "Session ID: #{session.id}\nTotal score: #{stat.score}\nGames played: #{stat.times_played}\nComment: #{session.comment}\n#{"="*70}" 
        }
        if temp.length == 0
            puts "="*70
            puts "Hey #{User.find(userID).name}! You are new here come back after playing some rounds \n"
            return false
        end
        
        return true

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
        
        print_break

        specific_session = find_session

        print_break

        while true do

            action_for_session= p.select("What would you like to do with this session?",["edit session comment(s)","view individual stats","view comment(s)","main menu"])
            
            break if action_for_session == "main menu"
            
            if action_for_session == "edit session comment(s)"
                edit_comment(specific_session) 
            elsif action_for_session == "view individual stats"
                display_ind_stats(specific_session)
            elsif action_for_session == "view comment(s)"
                display_comment(specific_session)
            end
            print_break
        end

    end

    def display_comment(session)
        print_break
        n_session = Session.find(session.id)
        puts "comment(s): #{n_session.comment}"
    end

    def display_ind_stats(session)
        stats = Gamestat.find(session.gamestat_id).attributes
        print_break
        puts "Game indivual score/times on session ID: #{session.id}\n\n"
        stats.each{|key, value|
            arr_key = key.split("_")
            value ||= 0
            print "#{arr_key[0]} #{arr_key[1]}: #{value} \n" if key != "id" && key != "score" && key != "times_played"
        }
         puts "\n"
    end

    def edit_comment(session)
        p = TTY::Prompt.new
        puts "Type the new comment for session ID: #{session.id}"
        ans = gets.chomp
        Session.update(session.id, comment: ans)
        puts "\n#{"="*70}\nComment succesfully updated"
    end

    def get_sessions_ids
        #self.sessions.map{|session| session.id} "Pluck" direct method on ActiveRecord
        self.sessions.pluck(:id)
    end
 
end
