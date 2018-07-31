class AddReferencesToTables < ActiveRecord::Migration[5.1]
  def change
    # City - belongs_to Country
    add_reference :cities, :country, foreign_key: true
    # Sector - belongs_to City
    add_reference :sectors, :city, foreign_key: true
    # Group - belongs_to Sector
    add_reference :groups, :sector, foreign_key: true
    # Member - belongs_to/has_many Group
    add_reference :members, :group, foreign_key: true
  end
end
