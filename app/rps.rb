require 'pry'
#Hash for win logic - 
def win_hash
    {
        ✊: "👋",
        ✌️: "✊",
        👋: "✌️"
    }
end

#.sample random move
def pick_rps

    ["✊","✌️","👋"].sample

end

#determing winner
def winner?(prompt, u_input)
 win_hash[prompt.to_sym] == u_input
end