ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
  end
  create_table "addresses", force: :cascade do |t|
    t.string "cep", null: false
    t.string "uf", null: false
    t.string "city", null: false
    t.string "neighborhood", null: true
    t.string "street", null: true
  end
  create_table :addresses_users, id: false do |t|
    t.belongs_to :user
    t.belongs_to :address
  end
end

User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
)
