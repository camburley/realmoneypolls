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

ActiveRecord::Schema.define(version: 2019_06_27_000637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arbitrages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "buy_id"
    t.string "sell_id"
    t.decimal "price_per_share_diff"
    t.decimal "percentage_change"
    t.integer "investment_revenue"
    t.integer "investment_loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cashouts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "contract_id"
    t.string "market_id"
    t.integer "numOfShares"
    t.string "market_type"
    t.string "contract_type"
    t.decimal "sharePrice_sold"
    t.string "sell_id"
    t.decimal "value_when_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string "status"
    t.bigint "contract_id"
    t.string "image"
    t.string "url"
    t.string "name"
    t.string "long_name"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "market_id"
    t.integer "totalValues"
  end

  create_table "markets", force: :cascade do |t|
    t.bigint "market_id"
    t.string "name"
    t.string "short_name"
    t.string "status"
    t.string "image"
    t.string "url"
    t.string "market_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contract_count"
    t.integer "contract_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "contract_id"
    t.string "market_id"
    t.integer "numOfShares"
    t.string "market_type"
    t.string "contract_type"
    t.decimal "buy_price"
    t.string "buy_id"
    t.string "current_value"
    t.boolean "trackPosition", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "image"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "values", force: :cascade do |t|
    t.integer "contract_id"
    t.string "last_trade_price"
    t.string "best_buy_yes_offer"
    t.string "best_buy_no_offer"
    t.string "best_sell_yes_price"
    t.string "best_sell_no_price"
    t.string "last_close_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
