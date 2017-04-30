class CreateIdeaTaggings < ActiveRecord::Migration
  def change
    create_table :idea_taggings do |t|
      t.references :idea, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
