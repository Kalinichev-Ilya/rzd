class CreatePassports < ActiveRecord::Migration[5.1]
  def change
    create_table :passports do |t|
      t.integer :idd
      t.string :series
      t.date :issue_date
      t.string :issuer
      t.string :division_code
      t.string :name
      t.string :surname
      t.string :birth_date

      t.timestamps
    end
  end
end
