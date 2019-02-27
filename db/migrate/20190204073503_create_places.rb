class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
    	t.string :name
    	t.string :location
    	t.string :image
      t.string :user_id
    end
  end
end
