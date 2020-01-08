class CreateCommentPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_posts do |t|
      t.belongs_to :comment, index: true
      t.belongs_to :post, index: true
    end
  end
end
