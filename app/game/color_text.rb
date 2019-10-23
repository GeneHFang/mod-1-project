require_relative '../../config/environment'
require_relative 'game'

# Color Text

class ColorText < Game

    def initialize
        @name = "colortext"
        @point_value = 2
    end

    def color_array  
        ["\nRed","\nGreen","\nBlue","\nYellow","\nWhite"]
    end

    def color_symbol_array
        [:red,:green,:blue,:yellow,:white]
    end

    def start_game
        p = super
        #answer will be a SYMBOL
        answer = color_symbol_array.sample
        # puts "\nPlease select the COLOR of the following text:"
        p.say("\nPlease select the ")
        p.say("COLOR", color: color_symbol_array.sample)
        p.say(" of the following text:")
        output = p.say(color_array.sample, color: answer)
        input = p.select(output, color_symbol_array)
        winner?(answer, input)
    end





# test = TTY::Prompt.new.say(color_array.sample, color: color_symbol_array.sample)

# welco = TTY::Prompt.new.select(test, color_symbol_array)

#red green blue yellow white

end