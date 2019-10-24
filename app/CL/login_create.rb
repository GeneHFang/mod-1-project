#file in charge of login in user profile or create a new User and upload it to DB

    def print_break
        puts "="*70
    end


    #look for inputed_user in DB
    def login(username)
        User.find_by(name: username)
    end

    #create new user in DB
    def create(username)
        User.create(name: username)
    end

    #check if user prompt for Exit
    def exit?(u_input)
        return true if u_input.upcase == "EXIT"
        false
    end

    #main method to login/create used at run.rb
    def login_or_create
        inicial_prompt = TTY::Prompt.new
        puts "\n"
        print_break
        inicial_selection = inicial_prompt.select("Welcome to Games2Fast2Quick:",["Login", "Create User", "Exit"])
        print_break
        abort ("Ending now")if inicial_selection == "Exit"

        #check selection create - login
        existing_user = nil
        
        if inicial_selection == "Login"
            while !existing_user do
            puts "Insert Username: (Type EXIT to go back)"
            user_input = gets.chomp
            if exit?(user_input)
                break
            end

            existing_user = login(user_input)
            puts "\n\nNo such User" unless existing_user
            puts "\n\nWelcome #{user_input}" if existing_user
            end  
        else
            puts "New Username: (Type EXIT to go back)" 
            user_input = gets.chomp
            return existing_user if exit?(user_input)
            existing_user = create(user_input)
        end     
        existing_user
    end

    