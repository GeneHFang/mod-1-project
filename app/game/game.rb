class Game

    attr_accessor :name, :point_value


    def start_game ### Should beginning any GAME instance
        TTY::Prompt.new
    end

    

    def  winner?(correct_answer, user_input)
        correct_answer == user_input
    end

end