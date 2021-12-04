module CarsHelper

    def is_user_signed_in_car_owner(car)
        return user_signed_in? && (car.user_id == current_user.id)
    end

    def is_user_signed_in_the_question_owner(question)
        return user_signed_in? && (question.user_id == current_user.id)
    end

    def is_user_signed_in_car_owner_and_able_to_answer(question)
        return user_signed_in? && @car.user_id == current_user.id && question.answer.nil?
    end

    def is_user_signed_in_car_owner_and_already_answered(question)
        return user_signed_in? && @car.user_id == current_user.id && !question.answer.nil?
    end

    def question_is_answered(question)
        !question.answer.nil?
    end
    
end
