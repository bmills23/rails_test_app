## do not rollback existing migration data, add new migration files instead

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description

      ## I think t.timestamps addresses created_at and updated_at
      t.timestamps
    end
  end
end
