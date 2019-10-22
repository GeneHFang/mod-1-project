class Game

    attr_reader :name


    def self.start_game ### Should beginning any GAME instance
        TTY::Prompt.new
    end

    def  self.winner?(prompt, user_input)

    end

end