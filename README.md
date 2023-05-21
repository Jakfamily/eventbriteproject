
# EventBriteProject
Eventbriteproject est une plateforme en ligne qui permet aux organisateurs d'événements de créer, de promouvoir et de gérer des événements de toutes sortes, tels que des conférences, des concerts, des festivals, des ateliers et bien d'autres.



## Authors

- [@Jakfamily](https://github.com/Jakfamily)


## 🚀 About Me
I'm a student to the hacking project 


## Installation

Install my-project 

```bash
  git clone git@github.com:Jakfamily/eventbriteproject.git
  cd eventbriteproject
  bundle Install
  rails db:drop
  rails db:create
  rails dn:migrate
  rails db:seed
  rails assets:precompile
  # creation compte pour admin 
  # s'inscrire 
  #puis 
  rails console
  user = User.find_by(email: 'mail@admin.com') # du compte cree pour etre admin 
  user.update(admin: true)
  # se reconecter afin de profiter du dashbord admin

```
    