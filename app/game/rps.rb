require_relative 'game'

#Rock Paper Scissor

class Rps < Game  #Inheriting from Game class 

    def initialize
        @name = "rps"
        @point_value = 1
    end


    #Hash for win logic - Rps specific method => SM
    def win_hash
        {
            ✊: "👋",
            ✌️: "✊",
            👋: "✌️"
        }
    end

    #array of rps - Rps SM
    def rpsArr
        ["✊","✌️","👋"]
    end

    #sample random move - Rps SM
    def pick_rps
        rpsArr.sample
    end

    #Starts a game of rps
    def start_game
        p = super
        cpu_move = pick_rps
        s = p.select("Your opponent throws #{cpu_move}. You throw:", rpsArr) #Prompt Rc/Pp/Sc and wait for input
        winner?(win_hash[cpu_move.to_sym],s)
    end

end