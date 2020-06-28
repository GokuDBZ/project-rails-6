class ChangeColumnPublisshedAt < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :publisshed_at,  :published_at
  end
end
