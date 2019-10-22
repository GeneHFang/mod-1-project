require_relative '../config/environment'
require_all 'app'

#User Login/Create - 
on_user = nil
while !on_user do
on_user = login_or_create
end

#hash with times_game_played and score = CURRENTLY Just for RPS
sessionResult = cli_runner
#updating gamestat to DB
stats_for_current_session = Gamestat.create(sessionResult)
#assosiating user and gamestat by session
Session.create(user: on_user, gamestat: stats_for_current_session)

binding.pry

puts "HELLO WORLD"

# => Testing
#
# test = TTY::Prompt.new.say("Hello", color: :blue)
# welco = TTY::Prompt.new.select(test, %w(blue black white))