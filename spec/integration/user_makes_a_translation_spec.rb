require 'rails_helper.rb'

feature"User Makes a Translation" do
    scenario "User successfully creates a new translation" do
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
        
        click_link "newtranslation"
        expect(page).to have_content("Create Translation")
        expect(page).to have_field("Project name")
        expect(page).to have_field("Source language")
        expect(page).to have_field("Target language")
        expect(page).to have_field("Source text")
        expect(page).to have_field("Target text")
        fill_in("Project name", with: "My Test")
        fill_in("Source language", with: "English")
        fill_in("Target language", with: "German")
        fill_in("Source text", with: "Hello, my name is John Smith")
        fill_in("Target text", with: "Hallo, ich heiße John Smith")
        click_button("Save Translation")
        expect(page).to have_content("My Test English Hello, my name is John Smith German Hallo, ich heiße John Smith")
    end
end
