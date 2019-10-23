require_relative '../config/environment'
require_all 'app'

on_user = nil
logout = true
delete = true
while true do

#User Login/Create - 
on_user = nil if logout || delete
while !on_user do
on_user = login_or_create
end

logout = false
delete = false
while true do
#hash with times_game_played and score = CURRENTLY Just for RPS
sessionResult = cli_runner
if sessionResult == "Logout"
    logout = true
    break
elsif sessionResult == "Delete User"
    puts "Are you sure?(Type 'Yes' to confirm)"
    ans = gets.chomp.upcase
    delete = true if ans == "YES"
    break
elsif sessionResult == "Instructions"
    puts "\n\nWelcome to Games2Fast2Quick.\nYou will be given 30 seconds to win as many games as possible."
    puts "Each successful game will earn you points corresponding to the game you are playing:"
    puts "Rock Paper Scissors : 1 point"
    puts "Color Text : 2 points"
    puts "Press The Key : 3 points"
    puts "Quick Math : 2 points"
    puts '='*70
    puts "Good luck!\n\n"
    break
elsif sessionResult == "View Past Sessions"
    User.formatted_sessions(on_user.id)
    on_user.view_session_options

    break
end
#updating gamestat to DB
stats_for_current_session = Gamestat.create(sessionResult)
puts "\n"
puts '='*70
puts "TIME IS UP!!!"
puts '='*70
puts "You played #{sessionResult[:times_played]} games and scored #{sessionResult[:score]} points.
To see your detailed session results, please select 'View Past Sessions' in the Main Menu\n\n"

comment_for_session = comment_session
#assosiating user and gamestat by session
Session.create(user: on_user, gamestat: stats_for_current_session, comment: comment_for_session)

end

next if logout

if delete
    on_user.delete
    next
end

end

# binding.pry

puts "HELLO WORLD"

# => Testing
#
# test = TTY::Prompt.new.say("Hello", color: :blue)
# welco = TTY::Prompt.new.select(test, %w(blue black white))