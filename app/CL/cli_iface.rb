
#returns user menu selection as a string
def main_menu
main_prompt = TTY::Prompt.new

selection = main_prompt.select("What do you want to do?", %w(Play Exit))
end

