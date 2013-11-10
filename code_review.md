Code Review Report
===============================================================================



Bugs
-------------------------------------------------------------------------------

### Routes

Line 2: Inccorrect syntax. This should be `root to: 'welcome/index'`
Line 4: List is not the correct action. by convention, this should be #index
Line 6: Should be POST HTTP verb, not GET
Line 6: create action is misspelled

### Controllers

#### HousesController

File is named incorrectly

##### index

Line 3: as a convention, instance variable should probably be `@houses`

#### StudentsController

Code is not correctly indented or spaced

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

Several spelling errors
New action


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


Areas to Improve
-------------------------------------------------------------------------------

No Tests

Add Ruby Version and Ruby Gemset files


Takeaways
-------------------------------------------------------------------------------


