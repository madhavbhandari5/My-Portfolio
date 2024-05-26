class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :level
      t.string :course
      t.string :university
      t.integer :passed_year
      t.float :gpa
      t.integer :anticipated_passed_year

      t.timestamps
    end
  end
end
