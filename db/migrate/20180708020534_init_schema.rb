class InitSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :gender
      t.string :classification
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :countries do |t|
      t.string :name, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :cities do |t|
      t.string :name, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :sectors do |t|
      t.string :name, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :groups do |t|
      t.string :name, null: false
      t.string :day, null: false
      t.string :hour, null: false
      t.integer :classes, default: 0, null: false
      t.boolean :active, default: true
      t.string :type, default: 'local'
      t.string :place
      t.string :phone, null: false
      t.text :comments
      t.references :leader, index: true, foreign_key: { to_table: :members }
      t.references :dependent, index: true, foreign_key: { to_table: :members }
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
