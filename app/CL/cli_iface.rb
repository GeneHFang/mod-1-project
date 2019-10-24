
#returns user menu selection as a string
def main_menu
main_prompt = TTY::Prompt.new

selection = main_prompt.select("What do you want to do?", ["Play","Instructions","Leaderboards","View Past Sessions","Logout","Delete User"])
end


# =========================+++===



# array.sample.start_game

# =========================+++===


#returns results in form of Hash { score : value, times_played: value }
def cli_runner
    
    choice = main_menu
    if choice == "Play"
        return play_game
    else
        return choice
    end
    
end
