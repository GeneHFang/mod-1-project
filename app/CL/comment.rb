    
    def comment_session
    
        puts "Would you like to leave a comment on your session? (Type your comment and hit Enter. The comment can be blank.)"
        comment = gets.chomp
        return comment if comment
        # binding.pry
        nil

    end