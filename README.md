#Intro


From the Heroku Page
---------------------------------------------------
Install the Heroku CLI

Download and install the Heroku CLI.

If you haven't already, log in to your Heroku account and follow the prompts to create a new SSH public key.

$ heroku login

Create a new Git repository

Initialize a git repository in a new or existing directory

$ cd my-project/
$ git init
$ heroku git:remote -a tutor4me

Deploy your application

Commit your code to the repository and deploy it to Heroku using Git.

$ git add .
$ git commit -am "message"
$ git push heroku master

Existing Git repository

For existing repositories, simply add the heroku remote

$ heroku git:remote -a tutor4me
--------------------------------------------------------


From a Codecademy Article
--------------------------------------------------------
1. Create a new Heroku account.

2. Install the Heroku Toolbelt on your computer. The Heroku Toolbelt is installed by default in new Codecademy workspaces.

3. In the terminal, log in using the email address and password you used when creating your Heroku account:
 $ heroku login

4. In Gemfile, add the pg gem to your Rails project. Change:
 gem sqlite
to
 gem 'sqlite3', group: :development
 gem 'pg', '0.18.1', group: :production

5. In Gemfile, add the rails_12factor gem::
 gem 'rails_12factor', group: :production

6. In the terminal, install the gems specified in the Gemfile:
 $ bundle install

7. Ensure config/database.yml is using the postgresql adapter. Change:
  production:
   <<: *default
   database: db/production.sqlite3
to
  production:
   <<: *default
   adapter: postgresql
   database: db/production.sqlite3

8. Commit your changes to git:
 $ git add .
 $ git commit -m "Heroku config"

9. In the terminal, create an app on Heroku:
 $ heroku create

10. Push your code to Heroku:
$ git push heroku master

11. If you are using the database in your application, migrate the database by running:
$ heroku run rake db:migrate

12. If you need to seed your database with data, run:
$ heroku run rake db:seed

13. Get the URL of your app and visit it in the browser:
$ heroku apps:info

In the output, copy the address in the Web URL field. Open a new tab in your browser, and visit your app.

-----------------------------------------------------------------------------

