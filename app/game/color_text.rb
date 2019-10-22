require_relative '../../config/environment'

defcolor_array = ["\n\nRed","\n\nGreen","\n\nBlue","\n\nYellow","\n\nWhite"]


color_symbol_array = [:red,:green,:blue,:yellow,:white]

test = TTY::Prompt.new.say(color_array.sample, color: color_symbol_array.sample)

welco = TTY::Prompt.new.select(test, color_symbol_array)

#red green blue yellow white

