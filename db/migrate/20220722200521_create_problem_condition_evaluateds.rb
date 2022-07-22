class CreateProblemConditionEvaluateds < ActiveRecord::Migration[6.1]
  def change
    create_table :problem_condition_evaluateds do |t|
      t.string :ciaps, array: true, default: []
      t.string :outroCiap1, array: true, default: []
      t.string :cid10
      t.string :cid10_2

      t.timestamps
    end
  end
end
