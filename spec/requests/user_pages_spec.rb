require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('注册') }
    it { should have_title(full_title('注册')) }
  end
end