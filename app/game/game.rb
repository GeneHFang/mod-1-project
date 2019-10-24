class Game

    attr_accessor :name, :point_value


    def start_game ### Should beginning any GAME instance
        TTY::Prompt.new
    end

    

    def  winner?(correct_answer, user_input)
        winner = (correct_answer == user_input)
        
        if winner
            puts "DING DING DING"
            `say "ding ding ding"` 
        else
            puts "WRONG"
            `say "Get good loser"`
        end
        
        winner
    end

end