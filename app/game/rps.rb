require 'pry'
require_relative'game'

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

    #determing winner - however logic change to Work for RPS
    def winner?(prompt, u_input)
        win_hash[prompt.to_sym] == u_input
    end

    #Starts a game of rps
    def start_game
        p = super
        cpu_move = pick_rps
        s = p.select(cpu_move, rpsArr) #Prompt Rc/Pp/Sc and wait for input
        winner?(cpu_move,s)
    end

end