class CreateSpecifications < ActiveRecord::Migration
  def change
  	create_table :specifications do |t|
  		t.references :user
  		t.string :species
  		t.string :planet
  		t.string :spaceship

  		t.timestamps null: false
	end
  end
end
