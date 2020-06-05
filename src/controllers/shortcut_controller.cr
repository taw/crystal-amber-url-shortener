class ShortcutController < ApplicationController
  getter shortcut = Shortcut.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_shortcut }
  end

  def index
    shortcuts = Shortcut.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    shortcut = Shortcut.new shortcut_params.validate!
    if shortcut.save
      redirect_to action: :index, flash: {"success" => "Shortcut has been created."}
    else
      flash[:danger] = "Could not create Shortcut!"
      render "new.slang"
    end
  end

  def update
    shortcut.set_attributes shortcut_params.validate!
    if shortcut.save
      redirect_to action: :index, flash: {"success" => "Shortcut has been updated."}
    else
      flash[:danger] = "Could not update Shortcut!"
      render "edit.slang"
    end
  end

  def destroy
    shortcut.destroy
    redirect_to action: :index, flash: {"success" => "Shortcut has been deleted."}
  end

  private def shortcut_params
    params.validation do
      required :slug
      required :url
      required :visits
    end
  end

  private def set_shortcut
    @shortcut = Shortcut.find! params[:id]
  end
end
