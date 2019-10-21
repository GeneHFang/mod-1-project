require_relative '../config/environment'
require_relative '../app/rps'
p = TTY::Prompt.new
cpu_move = pick_rps
s = p.select(cpu_move, %w(✊ ✌️ 👋))

result = winner?(cpu_move,s)

binding.pry

puts "HELLO WORLD"
