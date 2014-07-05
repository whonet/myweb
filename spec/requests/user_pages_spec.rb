require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('用户列表') }
    it { should have_content('用户列表') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.all.each do |user|
          expect(page).to have_content('Next', text: user.name)
        end
      end
    end

    describe "delete links" do

      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('删除', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('删除', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('删除', href: user_path(admin)) }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('注册') }
    it { should have_title(full_title('注册')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "立即注册" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "账户名",         with: "Example User"
        fill_in "电子邮件",        with: "user@example.com"
        fill_in "密码",           with: "foobar"
        fill_in "密码确认",        with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('退出') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: '欢迎') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("更新用户资料") }
      it { should have_title("用户编辑") }
    end

    describe "with invalid information" do
      before { click_button "保存更改" }

      it { should have_content('错误') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "账户名",             with: new_name
        fill_in "电子邮件",            with: new_email
        fill_in "密码",         with: user.password
        fill_in "密码确认", with: user.password
        click_button "保存更改"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('退出', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end