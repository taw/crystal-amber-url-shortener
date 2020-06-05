require "./spec_helper"

def shortcut_hash
  {"slug" => "Fake", "url" => "Fake", "visits" => "1"}
end

def shortcut_params
  params = [] of String
  params << "slug=#{shortcut_hash["slug"]}"
  params << "url=#{shortcut_hash["url"]}"
  params << "visits=#{shortcut_hash["visits"]}"
  params.join("&")
end

def create_shortcut
  model = Shortcut.new(shortcut_hash)
  model.save
  model
end

class ShortcutControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe ShortcutControllerTest do
  subject = ShortcutControllerTest.new

  it "renders shortcut index template" do
    Shortcut.clear
    response = subject.get "/shortcuts"

    response.status_code.should eq(200)
    response.body.should contain("shortcuts")
  end

  it "renders shortcut show template" do
    Shortcut.clear
    model = create_shortcut
    location = "/shortcuts/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Shortcut")
  end

  it "renders shortcut new template" do
    Shortcut.clear
    location = "/shortcuts/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Shortcut")
  end

  it "renders shortcut edit template" do
    Shortcut.clear
    model = create_shortcut
    location = "/shortcuts/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Shortcut")
  end

  it "creates a shortcut" do
    Shortcut.clear
    response = subject.post "/shortcuts", body: shortcut_params

    response.headers["Location"].should eq "/shortcuts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a shortcut" do
    Shortcut.clear
    model = create_shortcut
    response = subject.patch "/shortcuts/#{model.id}", body: shortcut_params

    response.headers["Location"].should eq "/shortcuts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a shortcut" do
    Shortcut.clear
    model = create_shortcut
    response = subject.delete "/shortcuts/#{model.id}"

    response.headers["Location"].should eq "/shortcuts"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
