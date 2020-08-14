class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
      t.references :applicant_user, foreign_key: { to_table: :users }
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
