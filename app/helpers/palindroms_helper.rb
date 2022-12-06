# frozen_string_literal: true

# helping me
module PalindromsHelper
    def correct_num
        number = params[:num].to_i
        if number.to_i < 0  then
          flash[:notice] = "Вводите числа >= 0"
        end
      end
  end
