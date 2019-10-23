require_relative '../../config/environment'
require_relative 'game'

#Quick math, how well do you know your arithmetic???

class QuickMath < Game

    def initialize
        @name = "quickmath"
        @point_value = 2
    end

    #number between 1-10, inclusive
    def sample_num
        (1..10).to_a.sample
    end

    #takes a number and returns another number within +/- 2 of it
    def create_variance(num)
        to_be_changed = num

        while to_be_changed == num
            to_be_changed = ((num-2)..(num+2)).to_a.sample
        end
        to_be_changed
    end


    #not including division since that'll be too hard to manage
    def sample_operator
        ['+', '-', '*'].sample
    end

    #create 3 choices which contain 1 answer
    def create_choices(op1, op2, optor, ans)
        choices = []

        choices << ans

        2.times{ 
            temp_ans = create_variance(op1).method(optor).(create_variance(op2))
            
            while choices.include?(temp_ans) do
                temp_ans = create_variance(op1).method(optor).(create_variance(op2))
            end
            
            choices << temp_ans
        }

        return choices.shuffle
    end



    def start_game
        p = super
        operand1 = sample_num
        operand2 = sample_num
        operator = sample_operator
        

        problem = "#{operand1} #{operator} #{operand2} = ?"
        answer = operand1.method(operator).(operand2)
        
        choice = create_choices(operand1,operand2,operator,answer)
        

        selection = p.select(problem, choice)

        winner?(answer, selection)

    end







end

# Debugging
# QuickMath.new.start_game