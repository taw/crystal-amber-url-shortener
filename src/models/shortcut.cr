class Shortcut < Granite::Base
  connection pg
  table shortcuts

  column id : Int64, primary: true
  column slug : String?
  column url : String?
  column visits : Int32?
  timestamps
end
