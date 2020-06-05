class GotoController < ApplicationController
  def goto
    shortcut = Shortcut.find_by!(slug: params[:slug])
    puts [:debug, shortcut]
    shortcut.visits += 1
    shortcut.save!
    redirect_to shortcut.url
  end
end
