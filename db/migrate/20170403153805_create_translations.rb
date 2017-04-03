class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.string :project_name
      t.string :source_language
      t.string :target_language
      t.text :source_text
      t.text :target_text
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
