require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content '标我吧'" do
      visit '/static_pages/home'
      expect(page).to have_content('标我吧')
    end

    it "should have the title '首页'" do
      visit '/static_pages/home'
      expect(page).to have_title("标我吧 | 首页")
    end
  end

  describe "Help page" do

    it "should have the content '帮助'" do
      visit '/static_pages/help'
      expect(page).to have_content('帮助')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("标我吧 | 帮助")
    end
  end

  describe "About page" do

    it "should have the content '关于我们'" do
      visit '/static_pages/about'
      expect(page).to have_content('关于我们')
    end

    it "should have the title '关于我们'" do
      visit '/static_pages/about'
      expect(page).to have_title("标我吧 | 关于我们")
    end
  end

  describe "Contact page" do

    it "should have the content '联系我们'" do
      visit '/static_pages/contact'
      expect(page).to have_content('联系我们')
    end

    it "should have the title '联系我们'" do
      visit '/static_pages/contact'
      expect(page).to have_title("标我吧 | 联系我们")
    end
  end
end