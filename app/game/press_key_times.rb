require_relative '../../config/environment'
require_relative 'game'

# Press 'X' key 'n' times

class PressKeyTimes < Game

    def initialize
        @name = "presskeytimes"
        @point_value = 3
    end

    def key_array
        ('a'..'z').to_a
    end

    def sample_char
        key_array.sample
    end

    def num_times
        (4..7).to_a.sample
    end

    def start_game
        p = super
        key_to_press = sample_char
        times_ans = num_times
        times_input = 0
        p.say("Press '#{key_to_press}' #{times_ans} times, Press ENTER to confirm")
        
        p.on(:keypress){|event|
         times_input +=1 if event.value == key_to_press
        }

        p.read_line('', echo: false)

        winner?(times_ans, times_input)
    end
end