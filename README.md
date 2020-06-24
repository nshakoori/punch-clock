Punch Clock Application:

To run:
    - Get the source code: 
        git clone https://github.com/nshakoori/punch-clock.git
    - Go to project's directory: 
        cd punch-clock
    - Install gems:
        bundle install
    - Run rails's server
        rails s
    - Go to localhost:3000 

How did you approach this challenge:
    The main matters I concidered when designing this app was flexibity for future features and developments and separation of concerns. 

    Having the three User, PunchCard and PunchRecords models separates the concerns of the user, the card and punch times which recudes coupling and increases cohesion. Now user roles can be added without impacting the current functionality of the application. PunchRecords can be edited/deleted without changing anything in the card. And a card can have new attributes in the feature if needed.

    I used devise for authentication instead of implementing it myself because it'll make adding user roles and authorization in the future easier and it can be integrated with omniauth to add multi provider authentication. 


What schema design did you choose and why?
    - There are three models: User, PunchCard and PunchRecord

    - Having a seporate User model helps with user authentication. It will also prepare the way to add authorization and different user roles in the future.
      The User has one PunchCard. This association let's the application to easily update User's PunchCards. For example if there is an Admin role, they can easily create, update and delete cards for users.

    - PunchCard model has many PunchRecords and belongs to a User. The association with PunchRecords let's PunchCard to make decision about itself, like if it's been used yet or if it's punched out. 
      I added the punched_out attribute to PunchCard beacuse I needed to know if a PunchCard is punched out or not to update the Punch In/Punch Out button and it was more performant to have that attribute
      and update it whenever a PunchRecord is created instead of having a function that goes through all PunchRecords to figure out if a card is puched out or not. 

    - PunchRecord model belongs to a PunchCard and keeps the punch in and punch out time. Having the records seporat keeps the functionalities of updating and editing the punch in and out times seporate from the PunchCard and keeps the application flexible and seporates the concerns of punch records from the card

    - I didn't add index to any of the tables because having the user_id in PunchCard and punch_card_id in PunchRecords are like having an index

If you were given another day to work on this, how would you spend it? What if you were
given a month?

    -Another day:
        - Show error messages to the user
        - Add pagination to the PunchRecord's table
        - Improve the front end by adding more styling
        - Fix installing the pg database gem so that I could use Heroku to show the project

    - A month:
        - Add user roles and Ususee the Cancancan gem for authorization. For example an Admin role can have the highest visibility in the app and create/update users. A Supervisor can be the person who takes care of User's punch cards including creating them when a new user starts.
        - Add omniauth so employees can log in using other providers
        - Add ability to Edit punch times and add notes
        - Add ability to delete punch records and add notes
        - Add ability to delete punch cards
        - Add ability to activate or disactivate punch cards


