class AddAnswerToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :answer, :text
  end
end
