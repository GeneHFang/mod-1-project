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
    delete = true
    break
elsif sessionResult == "View Past Sessions"
    on_user.formatted_sessions
    break
end
#updating gamestat to DB
stats_for_current_session = Gamestat.create(sessionResult)
#assosiating user and gamestat by session
Session.create(user: on_user, gamestat: stats_for_current_session)
puts "\n\nTIME IS UP!!!\n"
end

next if logout

if delete
    on_user.delete
    next
end

end

binding.pry

puts "HELLO WORLD"

# => Testing
#
# test = TTY::Prompt.new.say("Hello", color: :blue)
# welco = TTY::Prompt.new.select(test, %w(blue black white))