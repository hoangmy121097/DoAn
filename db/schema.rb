# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_29_091642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill", primary_key: "bill_id", id: :text, force: :cascade do |t|
    t.date "booking_date"
    t.date "delivery_date"
    t.text "status_pay"
  end

  create_table "bill_details", id: false, force: :cascade do |t|
    t.text "sell_number"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer", primary_key: "customer_id", id: :text, force: :cascade do |t|
    t.text "customer_name"
    t.text "customer_address"
    t.text "customer_phone"
    t.date "birthday"
  end

  create_table "customer_details", id: false, force: :cascade do |t|
    t.date "upgraded_day"
  end

  create_table "customer_type", primary_key: "customertype_id", id: :text, force: :cascade do |t|
    t.text "customertype_name"
    t.text "discount_customer"
  end

  create_table "details_import", id: false, force: :cascade do |t|
    t.text "number_import"
    t.text "import_price"
  end

  create_table "employees", primary_key: "employee_id", id: :text, force: :cascade do |t|
    t.text "password"
    t.text "employee_name"
    t.text "employee_address"
    t.text "phone"
  end

  create_table "enter_coupon", primary_key: "entercoupon_id", id: :text, force: :cascade do |t|
    t.date "date_order_provider"
    t.date "date_added"
  end

  create_table "inventory", primary_key: "warehouse_id", id: :text, force: :cascade do |t|
    t.date "date_warehouse"
    t.text "original_inventory"
    t.text "sell_number"
    t.decimal "number_import"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "product", primary_key: "product_id", id: :text, force: :cascade do |t|
    t.text "product_name"
    t.text "unit"
    t.text "status"
    t.text "image"
    t.decimal "price"
  end

  create_table "product_type", primary_key: "producttype_id", id: :text, force: :cascade do |t|
    t.text "name_product_type"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "size"
    t.text "color"
    t.string "image_url"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotion", primary_key: "promotion_id", id: :text, force: :cascade do |t|
    t.text "promotion_name"
    t.date "promotion_day"
    t.text "discount_rates"
  end

  create_table "supplier", id: false, force: :cascade do |t|
    t.text "supplier_id"
    t.text "supplier_name"
    t.text "supplier_address"
    t.text "supplier_phone"
  end

  create_table "transporters", id: false, force: :cascade do |t|
    t.text "shipping_id"
    t.text "shipping_name"
    t.text "shipping_address"
    t.text "transportation_phone"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
end
