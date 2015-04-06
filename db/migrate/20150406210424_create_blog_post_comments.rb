class CreateBlogPostComments < ActiveRecord::Migration
  def change
    create_table :blog_post_comments do |t|
      t.text :title
      t.text :body
      t.references :blog_post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
