# MY COOKBOOK
 > This project implements a simple cookbook to register your recipes and how much the ingredients cost.

## Screenshots
![screenshot-1](https://user-images.githubusercontent.com/36812672/83698216-7dbf0600-a5c6-11ea-9a2f-490c2294c63f.png)

![screenshot-2](https://user-images.githubusercontent.com/36812672/83698283-af37d180-a5c6-11ea-927c-aab72303c863.png)

![screenshot-3](https://user-images.githubusercontent.com/36812672/83698309-bf4fb100-a5c6-11ea-9a02-e1dd9252a12d.png)

![screenshot-4](https://user-images.githubusercontent.com/36812672/83698327-c971af80-a5c6-11ea-82b7-4c0444334b93.png)

![screenshot-5](https://user-images.githubusercontent.com/36812672/83698331-cd053680-a5c6-11ea-8920-be93ee7db775.png)

![screenshot-6](https://user-images.githubusercontent.com/36812672/83698334-cf679080-a5c6-11ea-8e93-715be56656a9.png)


## Features
- Sign up and sign in
- List of ingredients (transactions)
- List of recipes (groups)
- List of stores (additional feature)


## Built With
- Ruby on Rails
- Bootstrap for user interface
- Rspec for testing
- Cloudinary for image storage
- Postgres as database
- Rubocop as linter

## Data Model

![screenshot-7](https://user-images.githubusercontent.com/36812672/83704013-97684980-a5d6-11ea-901c-3e020b27faa0.png)

## Live Demo

[Cookbook](https://floating-anchorage-41841.herokuapp.com//) - Cookbook

## How to Install

- Install Ruby in your system. To install Ruby, you can read the [Documentation](https://www.ruby-lang.org/en/documentation/installation/).
- Install Rails. You can read this [page](https://www.theodinproject.com/courses/ruby-on-rails/lessons/your-first-rails-application-ruby-on-rails).
- Clone it using **git clone** command.
- Run in your terminal **bundle install**.
- Run in your terminal **rails db:migrate**.
- Run in your terminal **rails db:seed**.
- Create an account (it is for free) in [Cloudinary](https://cloudinary.com/users/login), confirm your e-mail and sign in.
- Go to your Cloudinary [Console](https://cloudinary.com/console/) and copy your **api_keys**, **api_secret** and **cloud_name** into **cloudinary.yml** file (which is in the **config** directory).
- Run in your terminal **rails server**.


## Automated Test

- This project uses RSpec for unit and integration testing.
- All files are in **spec** directory.
- In order to run the tests, in terminal, type: ```rspec```

## Author

👤 **Sergio Zambrano**

- Github: [@sergiomauz](https://github.com/sergiomauz)
- Twitter: [@sergiomauz](https://twitter.com/sergiomauz)
- Linkedin: [Sergio Zambrano](https://www.linkedin.com/in/sergiomauz/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!. Feel free to check the [issues page](https://github.com/sergiomauz/RoR-Capstone-Cookbook/issues).

## Show your support

Give a ⭐️ if you like this project!

## Credits

- The user interface [Snapscan](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=) was designed by [Gregoire Vella](https://www.behance.net/gregoirevella).
- The template **start bootstrap simple sidebar**, which was used for the user interface is available [here](https://github.com/BlackrockDigital/startbootstrap-simple-sidebar).


## 📝 License

This project is [MIT](LICENSE) licensed.