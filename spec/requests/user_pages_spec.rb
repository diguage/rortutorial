require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do 
      sign_in user
      visit users_path
    end

    it { should have_selector('title', text:'All users') }
    it { should have_selector('h1', text: 'All users') }

    describe "pagination" do
      it { should have_selector('div.pagination') }
      it "should list each user" do 
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text:user.name)        
        end
      end
    end
  end

  describe "Signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
         expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Dgg"
        fill_in "Email",        with: "leejun119@gmail.com"
        fill_in "Password",     with: "adai123"
        fill_in "Confirmation", with: "adai123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user)  { User.find_by_email('leejun119@gmail.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do 
      sign_in user
      visit edit_user_path(user) 
    end

    describe "paeg" do 
      it { should have_selector('h1', text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
      it { should have_link('change', href:'http://gravatar.com/emails') }
    end

    describe "with invalid information" do 
      before { click_button "Save change" }
      it { should have_content('error') }
    end
  end
end
