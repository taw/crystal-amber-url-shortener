class Shortcut < Granite::Base
  connection pg
  table shortcuts

  column id : Int64, primary: true
  column slug : String = "", unique: true
  column url : String = "", unique: true
  column visits : Int32 = 0
  timestamps
end
