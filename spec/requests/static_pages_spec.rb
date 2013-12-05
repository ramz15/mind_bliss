require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path }
    it { should have_content('create happiness') }
    it { should have_title("MindBliss") }
  end

  describe "About page" do

    before { visit "/about" }
    it { should have_content('About MindBliss') }
    it { should have_title("MindBliss | About") }

  end


end
