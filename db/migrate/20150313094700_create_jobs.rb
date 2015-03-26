class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :user, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :travel
      t.boolean :driver_license

      t.timestamps
    end
  end
end
