

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
            print_break
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

            action_for_session= p.select("What would you like to do with this session?",["Edit session comment","View individual stats","View comment","Main menu"])
            
            break if action_for_session == "Main menu"
            
            if action_for_session == "Edit session comment"
                edit_comment(specific_session) 
            elsif action_for_session == "View individual stats"
                display_ind_stats(specific_session)
            elsif action_for_session == "View comment"
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

    def leaderboard
        p = TTY::Prompt.new
        ans = p.select("Please select an option:",["Score", "Sessions played", "Main menu"])

        if ans == "Score"
            score
        elsif ans == "Sessions played"
            sessions_played 
        else
            return nil
        end
    end


    def score 
        p = TTY::Prompt.new
        ans = p.select("Please select a score category:",["Overall","Rock Paper Scissors","QuickMath","Color Text","Press Key Times"])
        
        print_break
        puts "#{ans} Hi Scores"
        print_break
        i = 1
        Gamestat.order(option_hash[ans].to_sym).reverse.each { |gamestat|

            unless (gamestat.method(option_hash[ans]).() == nil || gamestat.users[0] == nil )
            puts "#{i}) User : #{gamestat.users[0].name} || Score : #{gamestat.method(option_hash[ans]).()}"
            i+=1
            end
        }
        print_break
        # binding.pry

        # somehash["Overall"] #=> :score
        # somehash["Color Text"] #=> :colortext_score
    end

    def option_hash
        hash = { 
            "Overall" => "score",
            "Rock Paper Scissors" => "rps_score",
            "QuickMath" => "quickmath_score",
            "Color Text" => "colortext_score",
            "Press Key Times"=> "presskeytimes_score"
        }
    end


    def sessions_played
        arr = Session.group(:user_id).count.sort_by{|k,v| v}.reverse

        print_break
        puts "Total Sessions Played"
        print_break
        arr.each {|array| 
            unless User.find_by(id: array[0]) == nil
                puts "Name : #{User.find(array[0]).name} || Total sessions: #{array[1]}"
            end
        
        }
        print_break
    end


    #Gamestat.order(score: :desc)[0].score
       #Gamestat.order(score: :desc)[0].users[0].name
       #Session.group(:user_id).count.sort_by{|k,v| v}.reverse
       # -> [[user_id,total#sessions],[]]
       #[[user_id,total#sessions],[]].each{|array| puts “#{User.find(array[0]).name} || total sessions: #{array[1]}“}


    # def self.scores
    # end

 
end

