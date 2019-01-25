# Module One Final Project

## UFC Database Query

### Project Description

 This command line database analysis app interacts with a database of fighters associated with the Ultimate Fighting Championship. With our current functionality, a user is able to accept a list of commands that will display the information that they queried. The underlying ruby programs utilize Active Record to Create, Read, Update, and Delete our database of fighters depending on the commands that the user inputs. Our app can tell the user the camp or weight class that a given fighter belongs to, it also is able to take in two fighters and determine if they are able to fight one another and displays a champion, the app can also tell the user what camps are best for a given weight class, and the user is able to create and delete fighters from the database.  

### Install Instructions

  1. Fork and clone the project file from GitHub: <GitHub url>
  2. Run `rake db:migrate` in your terminal to build the "create tables" methods using Active Record
  3. Once the classes are migrated, run `rake db:seed` in your terminal to create the tables in our database that we will be interacting with
  4. With the database populated, run `ruby bin/run.rb` and follow the instructions to Create, Read, Update, or Destroy instances associated with the database.

### Contributors / License

  1. This is the original Google Sheets document that we used to extrapolate our data > https://docs.google.com/spreadsheets/d/1z3QX0uWXv-XHX2Nfuj6zZHrfEeXI3A9CKWkrGaBzB8s/edit#gid=0
  2. We followed this video tutorial to change our Google Sheets to usable JSON > https://www.youtube.com/watch?v=uJDLT8nh2ps 
