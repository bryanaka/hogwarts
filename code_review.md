Code Review Report
===============================================================================



Bugs
-------------------------------------------------------------------------------

### Migrations

Relationship was not set up correctly. A House has many students, so the students needed the reference, not the house.

create_table block for house was missing the t block argument

The table needs to be plural so changed to houses.

changed to using the `change` method instead of up and down


### Routes

Line 2: Incorrect syntax. This should be `root to: 'welcome/index'`
Line 4: List is not the correct action. by convention, this should be #index
Line 6: Should be POST HTTP verb, not GET
Line 6: create action is misspelled

### Controllers

#### HousesController

File is named incorrectly

##### index

Line 3: as a convention, instance variable should probably be `@houses`

#### StudentsController

Code is not correctly indented or spaced, this lead to missing the closing `end`
and created an error

##### Show
Line 6: Student instance variable is misspelled
Line 6: `params[:student]` isn't currently set by the route
Isn't fetching any data from the database

##### New
Line 9: params is misspelled
Line 10: This is not the way to create a Student in Rails, Line 9 and 10 are 
trying to do something about it
Line 11: house is undefined right now, so you can't use the << operation on it
Line 12: index is misspelled

### Models

#### Student

Line 1: don't use def here, should be a class
Line 1: misspelled ActiveRecord::Base

#### House

According to the schema, a house should have many students
We should be using `has_many :students` 

Line 1: Needs to inherit from ActiveRecord::Base. Not ActiveRecord
Line 1: Should be singular named, so use `class House` instead of `houses`
Line 2: Should be attr_accessible
Line 2: house_name should be just name

### Views

#### Welcome/index.html.erb

Will not be rendered, since it is not associated with a controller. It is a 
common pattern to use a PagesController or a gem like thoughtbot's `high voltage`
which essentially takes care of the PageController for you. In this case though,
it has no dynamic content and can also be placed in the public folder to be 
served up.

For now we will use a basic PagesController, just because the attempted use of
`root to: ` in the routes file implies that it was going to use a controller.

#### houses/index.html.erb

Line 2: code is using `house` instead of the `h` block variable set in Line 1
Line 2: This could be done easier with a rails `link_to` helper.

#### houses/show.html.erb

HousesController has no #show action, but the application implies it should 
have one

Line 1: Should be using a `<%=` because it is suppose to be rendering
Line 4: Extra closing `</li>` 
Line 5: `<ul>` needs to go after the `<% end %>`

### student should be students by convention

#### student/create.html.erb

Create is an action that simply creates a record/resource. In this case,
StudentController#create should be creating the new student, then redirect 
elsewhere. By convention, #create, #update, and #delete Actions do not usually 
have views associated with them. Instead, the #index, #edit, #new, #show actions 
do have views.

#### student/index.html.erb

Line 1: `the` is misspelled
Line 2: `student` is misspelled in the block argument
Line 3: The link is not valid. should be `<%= link_to show_student_path(student) %>`
Line 4: Only use `<%=` when you are rendering something. Control statements 
should look like this: `<% end %>` since they are not rendering anything.

#### student/new.html.erb

Lines 2-7: Unless you are familiar with Rails internals and have a special edge 
case, I would stick to using the Rails Form Helpers. Form Helpers will make 
sure that the information is formated in the way Rails wants it, and will 
help prevent Cross Site Request Forgery (CSRF).

Areas to Improve
-------------------------------------------------------------------------------

No Tests

Add Ruby Version and Ruby Gemset files


Takeaways
-------------------------------------------------------------------------------


