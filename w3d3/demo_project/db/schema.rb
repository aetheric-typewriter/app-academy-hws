create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.integer "house_id", null: false
end

create_table "houses", force: :cascade do |t|
    t.string "address", null: false
end