require "./spec_helper"

describe Backup do

  EXAMPLE_LOCAL_GEMS = [
    "graphql",
    "did_you_mean",
    "bcrypt",
    "nokogiri"
  ]

  it "with argument" do
    Gemigrate::Main.run("backup asd")
  end

  it "with multiple arguments" do

  end

  it "without argument" do

  end

  it "with overwrite flag" do

  end

  it "without overwrite flag" do

  end
end
