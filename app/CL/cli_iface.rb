
#returns user menu selection as a string
def main_menu
main_prompt = TTY::Prompt.new

selection = main_prompt.select("What do you want to do?", %w(Play Exit))
end

#returns results in form of Hash { score : value, times_played: value }
def cli_runner
    
    choice = main_menu
    abort("Ending now") if choice == "Exit"
    returnHash = {}
    returnHash[:score] = 0
    returnHash[:times_played] = 0
    start_time = Time.now
    end_time = start_time + 10
    while true do
        current_time = Time.now
        #end immediately if time is up
        break if current_time > end_time
    
        returnHash[:times_played] += 1
    
        returnHash[:score]+=1 if start_rps 
        
        puts "="*70
        
        
    end
    
    returnHash

end
