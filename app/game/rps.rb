require 'pry'
require_relative'game'

class Rps < Game  #Inheriting from Game class 

    #Hash for win logic - Rps specific method => SM
    def self.win_hash
        {
            ✊: "👋",
            ✌️: "✊",
            👋: "✌️"
        }
    end

    #array of rps - Rps SM
    def self.rpsArr
        ["✊","✌️","👋"]
    end

    #sample random move - Rps SM
    def self.pick_rps
        rpsArr.sample
    end

    #determing winner - however logic change to Work for RPS
    def self.winner?(prompt, u_input)
        win_hash[prompt.to_sym] == u_input
    end

    #Starts a game of rps
    def self.start_game
        p = super
        cpu_move = pick_rps
        s = p.select(cpu_move, rpsArr) #Prompt Rc/Pp/Sc and wait for input
        winner?(cpu_move,s)
    end

end