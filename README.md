# Ruby on Rails app - Tutor_4_me

Setup Instructions:
- Pre-requisite:
- Ruby ver. 2.4.1 or later installed (Install via rvm.io)
- Sqlite3 ver. 3.16.0 or later installed
- Rails ver. 5.1.5 or later installed (After Ruby is installed, run: $ gem install rails)
- Git installed (Install via git-scm.com)

- Open terminal and clone the git repository by running:
- $ git clone git@github.com:j-shim/cmpt276project.git
- Change directory into the repo:
- $ cd cmpt276project
- If bundler is not installed, run:
- $ gem install bundler
- Install dependencies:
- $ bundle install --without production
- Migrate database:
- $ rails db:migrate
- Start Puma server by running:
- $ rails s
- Open a web browser and type in the address bar:
- localhost:3000
