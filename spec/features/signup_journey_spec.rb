require 'rails_helper'

RSpec.describe 'Sign Up' do

    def fill_in_signup_fields
        fill_in "Email", with: "abc@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
    end

    def fill_in_project_fields
        fill_in "Title", with: "Project 1"
        fill_in "Description", with: "Description"
        # fill_in "project_status", with: "In Progress"
        select "In Progress", :from=> "project_status"
        select "2021", :from=> "project[due_date(1i)]"
        select "December", :from=> "project[due_date(2i)]"
        select "30", :from=> "project[due_date(3i)]"
        # fill_in "Due Date", with: "2021-11-15"
        click_button "Submit"
    end

    def fill_in_task_fields
        fill_in "Title", with: "Task 1"
        fill_in "Description", with: "Description 3"
        fill_in "Story point", with: "3.0"
        fill_in "Task type", with: "Task"
        select "Low", :from=> "task_priority"
        select "2021", :from=> "task[due_date(1i)]"
        select "December", :from=> "task[due_date(2i)]"
        select "30", :from=> "task[due_date(3i)]"   
        select "2021", :from=> "task[end_date(1i)]"
        select "December", :from=> "task[end_date(2i)]"
        select "30", :from=> "task[end_date(3i)]"  
        select "2021", :from=> "task[start_date(1i)]"
        select "December", :from=> "task[start_date(2i)]"
        select "30", :from=> "task[start_date(3i)]"  
        select "In Progress", :from=> "task_status"
        select "Low", :from=> "task_priority"
        select "To Do", :from => "Phase"
        click_button("Submit")
    end

    def fill_in_phase_fields
        fill_in "Title", with:"To Do"
        click_button("Submit")
    end

    def fill_in_subtasks_field
        fill_in "Title", with: "Sub Task 1"
        select "In Progress", :from=> "sub_task_status"
        click_button("Submit")
    end

    def fill_in_comments_field
        fill_in "Body", with: "This is a new comment"
        click_button("Submit")
    end

    describe "Sign Up Journey" do
        it 'tries to sign up' do
        visit('/')
        within find(".buttons") do
            click_link('Sign Up')   #on two occurences try finding in the div
            expect(current_path).to eql('/users/sign_up')
        end
        expect(page).to have_content("Email")
        page.status_code.should == 200
        fill_in_signup_fields
        expect(page).to have_content("View Projects")  #on successfull sign user will be able to see the link to view projects
        visit("/phases")
        expect(current_path).to eql("/phases")
        expect(page).to have_content("Phases")
        click_link("New Phase")
        expect(current_path).to eql("/phases/new")
        expect(page).to have_content("New Phase")  
        fill_in_phase_fields
        visit('/projects') #now will try to go to project page
        page.status_code.should == 200
        expect(page).to have_content("No Projects Yet")
        page.status_code.should == 200
        click_link('Add Project')
        expect(current_path).to eql('/projects/new') #now user is at create project path
        page.status_code.should == 200
        fill_in_project_fields
        expect(current_path).to eql("/projects/1")  #failed and is in project/1 page only
        page.status_code.should == 200
        expect(page).to have_content("No Tasks Yet")
        fill_in_task_fields
        expect(current_path).to eql("/projects/1")
        expect(page).to have_content("Task 1")
        click_link("View >")
        expect(current_path).to eql("/projects/1/tasks/1")
        expect(page).to have_content("SubTasks")
        expect(page).to have_content("No SubTasks Yet!")
        within find(".new_sub_task") do
          fill_in_subtasks_field
        end
        expect(page).to have_no_content("No SubTasks Yet!")
        expect(page).to have_content("Destroy")  #after successful creation the sub task is created
        expect(current_path).to eql("/projects/1/tasks/1")  #the page is redirected to the task page
        expect(page).to have_content("Comments")
        expect(page).to have_content("No Comments Yet!")
        within find(".new_comment") do
            fill_in_comments_field
          end
          expect(page).to have_no_content("No Comments Yet!")
          expect(current_path).to eql("/projects/1/tasks/1")  #the page is redirected to the task page
          expect(page).to have_content("This is a new comment")
    end
end
end
