# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140928171058) do

  create_table "credit_lines", force: true do |t|
    t.string   "name"
    t.float    "annualRate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_lines", ["user_id"], name: "index_credit_lines_on_user_id", using: :btree

  create_table "credits", force: true do |t|
    t.string   "cedula"
    t.string   "valorCredito"
    t.integer  "plazo"
    t.integer  "user_id"
    t.integer  "lineaCredito"
    t.string   "estado",       default: "En proceso"
    t.string   "nivelRiesgo",  default: "En proceso"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credits", ["user_id", "lineaCredito"], name: "index_credits_on_user_id_and_lineaCredito", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "fees", force: true do |t|
    t.integer  "credit_id"
    t.integer  "numero_cuota"
    t.string   "pago_intereses"
    t.string   "amortizacion"
    t.string   "valor_cuota"
    t.string   "saldo_pendiente"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fees", ["credit_id"], name: "index_fees_on_credit_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "pyme"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
