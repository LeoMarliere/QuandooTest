# Quandoo Technical Test  

This Application is here to display a list of Users obtained from a REST API.  
When the user clck on on item of the list, we display the posts associated to  
the selected User.

For a full description of the test, check the following URL :
https://gitlab.com/quandoo-recruitment/ios-engineer

# Installation

You just need to clone the project using the following command :
- git clone https://github.com/LeoMarliere/QuandooTest.git

Then you can start the project without anything more needed.

# Application Architecture : VIP

The application is build following the VIP Pattern. Each screen is made of a ViewController, an Interactor and a Presenter. Each element is only aware of the existance of one other, and they communicate with Protocols.

The ViewController is in share on the UI and of the user interactions.
The Interactor is in charge of all the logic, and is used to fetch the data.
The Presenter is in charge of mapping the Data and transfering them to the View.

# Features

The application have 2 features.

The first one is the display of a list of User. This screen open when you strat the app. Every users have a name, a surname, an email and an address. The list is fetched from a distant API. This screen is build using UIKit.

The second feature is the display of a list of Post. When the user click on an User in the first screen, we open the second screen. We fetch and display all the post associated with the selected user. Every post have a title and a body. This screen is build using SwuiftUI.
