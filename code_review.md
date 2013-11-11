Code Review Report
===============================================================================

Sorting Hat
----------------

I personally don't like that this is in the Student Model and think the sorting hat may be a service object.
However, if I was teaching a student who is new, it would be a disservice to overcomplicate things
when they obviously have other concerns right now. So I left it in the model to support the ideology of fat models.

I also am not a huge fan of callbacks (see Ernie Miller's talks about it), but it is a rails-ism as well, 
so I used them.

Bugs
-------------------------------------------------------------------------------

### Migrations

- Relationship was not set up correctly. A House has many students, so the students needed the reference, not the house.

- create_table block for house was missing the t block argument

- The table needs to be plural so changed to houses.

- changed to using the `change` method instead of up and down


### Routes

- Incorrect syntax for declaring the root. This should be `root to: 'welcome#index'` with a controller and action
- List is not the correct action. by convention, this should be #index
- create action is misspelled
- create action should be mapped to POST, not GET

### Controllers

#### HousesController

- File is named incorrectly

##### index

- as a convention, instance variable should probably be `@houses`

##### show

- Was missing this action

#### StudentsController

- Code is not correctly indented or spaced, this lead to missing the closing `end`
and created an error

##### Index

- `Students.all` should be `Student.all`

##### Show
- Student instance variable is misspelled
- `params[:student]` isn't currently set by the route
- Isn't fetching any data from the database, use `Student.find(params[:id])`

##### New
- params is misspelled
- `#new` should not be creating the resource. that is what the create action is for.
- house is undefined right now, so you can't use the << operation on it
- index is misspelled

### Models

#### Student

- don't use def here, should be a class
- misspelled ActiveRecord::Base

#### House

According to the schema, a house should have many students
We should be using `has_many :students` 
File is misnamed. Should be house.rb

- Needs to inherit from ActiveRecord::Base. Not ActiveRecord
- Should be singular named, so use `class House` instead of `houses`
- Should be attr_accessible
- house_name should be just name
- should be `attr_accesible`, `attr_accessor` is a ruby method for getters and setters

### Views

#### Welcome/index.html.erb

Will not be rendered, since it is not associated with a controller. It is a 
common pattern to use a PagesController or a gem like thoughtbot's `high voltage`
which essentially takes care of the PageController for you. In this case though,
it has no dynamic content and can also be placed in the public folder to be 
served up.

For now we will leave it in the public directory, until dynamic content is needed or 
maintaining the layout becomes even a little difficult.

#### layouts/application.html.erb

- Should have a `<%= yield %>` in the body in order to render the views inside the layout
- Moved Scripts to the bottom of the page. This will just better practice.

#### houses/index.html.erb

- code is using `house` instead of the `h` block variable set in Line 1, but 
should probably use house all the way through
- This could be done easier with a rails `link_to` helper.

#### houses/show.html.erb

HousesController has no #show action, but the application implies it should 
have one

- Should be using a `<%=` because it is suppose to be rendering
- Extra closing `</li>` 
- `<ul>` needs to go after the `<% end %>`

### student should be students by convention in the folder structure

#### students/create.html.erb

Create is an action that simply creates a record/resource, then redirects. Shouldn't
have a template

#### students/index.html.erb

- `the` is misspelled
- `student` is misspelled in the block argument
- The link is not valid. should be `<%= link_to student_path(student) %>`
- Only use `<%=` when you are rendering something. Control statements 
should look like this: `<% end %>` since they are not rendering anything.

#### students/new.html.erb

Unless you are familiar with Rails internals and have a special edge 
case, I would stick to using the Rails Form Helpers. Form Helpers will make 
sure that the information is formated in the way Rails wants it, and will 
help prevent Cross Site Request Forgery (CSRF).

- h1 tag wasn't closed

Areas to Improve
-------------------------------------------------------------------------------

- No Tests, should probably talk about TDD
- Knowledge of conventions was partially there, but needs a lot of reinforcement.


Takeaways
-------------------------------------------------------------------------------

The student doens't seems to have a strong understading of the rails conventions. 
Probably the best idea is to teach them about rails generators and look at the 
code they produce. Though using scaffolds is looked down upon in production, it 
would help the student get a better idea of all the rails-isms. Maybe write an App
with one scaffolded resource and two non-scaffolded resources.

Also, there were a lot of spelling and syntax errors. We may want to follow up 
on what kind of editor they are using. It may help to set them up with something 
that will alert them about syntax errors or even spelling errors.

