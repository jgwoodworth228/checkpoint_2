class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :course_name
      t.string :course_department
      t.text :course_description
      t.integer :course_creator

      t.timestamps

    end
  end
end
