def game_array 
    [Rps.new,
   ColorText.new,PressKeyTimes.new]   
end

def play_game
    
        returnHash = {}

        
    returnHash[:score] = 0
    returnHash[:times_played] = 0
    start_time = Time.now
    end_time = start_time + 10
    while true do
        current_time = Time.now
        #end immediately if time is up
        break if current_time > end_time

        game1 = game_array.sample
        game_name_string = game1.name
        current_game_score = "#{game_name_string}_score".to_sym
        current_game_times = "#{game_name_string}_times".to_sym
        
        
        #Increment player score
        if game1.start_game 
            returnHash[current_game_score] ? returnHash[current_game_score] += game1.point_value : returnHash[current_game_score] = game1.point_value
            returnHash[:score] += game1.point_value
        end

        #Increment times played
        returnHash[current_game_times] ? returnHash[current_game_times] += 1 : returnHash[current_game_times] = 1
        returnHash[:times_played] += 1
    
        puts "="*70
        

        
        
    end

    returnHash
    # Structure of return value
        #returnHash = {
        #  score: 0,
        #  times_played: 0,
        #  rps_score: 0, rps_times: 0 ...
end