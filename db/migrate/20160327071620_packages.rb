class Packages < ActiveRecord::Migration
  def change
  	change_table :packages do |t|
  		t.rename :type, :package_type
  	end
  end
end
