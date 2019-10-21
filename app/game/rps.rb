require 'pry'
#Hash for win logic - 
def win_hash
    {
        ✊: "👋",
        ✌️: "✊",
        👋: "✌️"
    }
end

#array of rps
def rpsArr

    ["✊","✌️","👋"]
end


#sample random move
def pick_rps

    rpsArr.sample

end

#determing winner
def winner?(prompt, u_input)
 win_hash[prompt.to_sym] == u_input
end

#Starts a game of rps
def start_rps

    p = TTY::Prompt.new
    cpu_move = pick_rps
    s = p.select(cpu_move, rpsArr)

    winner?(cpu_move,s)
end
