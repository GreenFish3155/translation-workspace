require 'rails_helper.rb'

feature"User Makes an Account" do
    scenario "User successfully creates a new account from the welcome page" do
        visit welcome_index_path
        click_link "signup"
        expect(page).to have_content("Create Account")
        expect(page).to have_field("Username")
        expect(page).to have_field("Password")
        expect(page).to have_field("First name")
        expect(page).to have_field("Last name")
        fill_in("Username", with: "myuser")
        fill_in("Password", with: "mypassword")
        fill_in("First name", with: "John")
        fill_in("Last name", with: "Smith")
        click_button("Create Account")
        expect(page).to have_content("Welcome, John Smith")
    end
end

feature"User Makes an Account" do
    scenario "User successfully logs in" do
        visit welcome_index_path
        click_link "signup"
        expect(page).to have_content("Create Account")
        expect(page).to have_field("Username")
        expect(page).to have_field("Password")
        expect(page).to have_field("First name")
        expect(page).to have_field("Last name")
        fill_in("Username", with: "myuser")
        fill_in("Password", with: "mypassword")
        fill_in("First name", with: "John")
        fill_in("Last name", with: "Smith")
        click_button("Create Account")
        expect(page).to have_content("Welcome, John Smith")
        
        click_link "logout"
        
        expect(page).to have_content("Welcome to Translation Workspace")
        expect(page).to have_field("username")
        expect(page).to have_field("field2")
        fill_in("username", with: "myuser")
        fill_in("field2", with: "mypassword")
        click_button("Login")
        expect(page).to have_content("Welcome, John Smith")
    end
end

feature"User Deletes an Account" do
    scenario "User successfully creates and deletes an account" do
        visit welcome_index_path
        click_link "signup"
        expect(page).to have_content("Create Account")
        expect(page).to have_field("Username")
        expect(page).to have_field("Password")
        expect(page).to have_field("First name")
        expect(page).to have_field("Last name")
        fill_in("Username", with: "myuser")
        fill_in("Password", with: "mypassword")
        fill_in("First name", with: "John")
        fill_in("Last name", with: "Smith")
        click_button("Create Account")
        expect(page).to have_content("Welcome, John Smith")
        click_link "Account"
        expect(page).to have_content("Your Account")
        click_link("Delete")
        expect(page).to have_content("Welcome to Translation Workspace")
    end
end