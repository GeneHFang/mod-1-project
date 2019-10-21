require_relative '../config/environment'
require_all 'app'


sessionResult = cli_runner

stat1 = Gamestat.create(rps_score: sessionResult[:score], rps_times: sessionResult[:times_played])

user1 = User.find_by(name: "Gene")


Session.create(user: user1, gamestat: stat1)


binding.pry

puts "HELLO WORLD"
