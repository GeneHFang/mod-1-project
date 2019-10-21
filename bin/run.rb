require_relative '../config/environment'
require_all 'app'

x = 0
choice = main_menu
abort("Ending now") if choice == "Exit"
start_time = Time.now
end_time = start_time + 10
while true do
    current_time = Time.now
    #end immediately if time is up
    break if current_time > end_time

    x+=1 if start_rps 
    
    puts "="*70
    
    
end



# p = TTY::Prompt.new
# cpu_move = pick_rps
# s = p.select(cpu_move, %w(✊ ✌️ 👋))

# result = winner?(cpu_move,s)

binding.pry

puts "HELLO WORLD"
