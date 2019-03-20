# Theurgy
A rails web application for managing and tracking mental health treatment.

This web app was designed for health providers that want to track their patient's mental health symptoms, diagnoses, and treatments.

Please visit the live application [here](http://theurgy.herokuapp.com).

## Installation
To run locally simply clone this repository.

And then execute:

    $ bundle install
    $ rake db:migrate

If you would like to experiment with the application using seed data, then execute:

    $ rake db:seed

Finally, run:

    $ rails s

## Usage

To demo a standard user without creating an account please use the following login credentials:

- username: s_user
- password: 123

To demo an administrative user without creating an account please use the following login credentials:

- username: a_user
- password: 456

Visitors can view available treatments and the home page without logging in. If a user would like to utilize the functionality of the application, they must register and sign in. Once registered, a standard user can access their patient list and view potential symptoms, diagnoses, and treatments. Standard users can also log in using Facebook. Standard users that have logged in can add to and edit their patients, as well as assign their patients treatments and designate the status of that treatment (active vs. inactive). If a user is created with administrative privileges, that user has the same access as a standard user and in addition can alter the available symptoms, diagnoses, and treatments available in the application.

NOTE: The ability to create an adminstrator account during user registration is for demonstration purposes only and is NOT a reflection of best account security practices.

## Features

- oAuth account creation and login via Facebook
- quick preview of newly created patients without full page refresh
- view a list of patients by name
- differentiation of access to CRUD functionality based on user credentials (visitor vs user vs administrator)
- utilizes postgreSQL database
- bcrypt for password security
- MVC design
- jQuery and javascript to reduce the number of full page refreshes, speed up navigation throughout the application, and increase user     interactivity



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Hector-Ariceaga/theurgy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Theurgy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'Hector-Ariceaga'/theurgy/blob/master/CODE_OF_CONDUCT.md).
