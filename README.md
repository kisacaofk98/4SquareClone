# Foursquare Clone iOS Application

Welcome to the Foursquare Clone iOS Application! This application is a basic version of Foursquare, allowing users to save and view locations on a map, along with name, type, and comments. This README file will guide you through the setup and usage of the application.

## Table of Contents
1. [Features](#features)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Dependencies](#dependencies)


## Features <a name="features"></a>
- **Add Location**: Users can add a location by providing its name, type, and optional comments.
- **Save Location**: Users can save the location along with its details on the map.
- **View Locations**: Saved locations are displayed on the map for easy access.
- **Navigation**: Users can get navigation directions to a saved location using built-in maps.

## Setup <a name="setup"></a>
1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Install Parse SDK and set up your Parse server. You can follow the instructions on the Parse website for setting up a server and integrating the SDK into your project.
4. Replace the Parse configurations in the project with your own Parse App ID and Parse Server URL.
5. Build and run the project on a simulator or a physical device.

## Usage <a name="usage"></a>
1. Upon launching the app, you'll see a table view.
2. Tap on the "+" button to add a new location.
3. Enter the name, type, and optional comments for the location.
4. Tap on the "Save" button to save the location on the map.
5. You can view all saved locations on the map with pins.
6. Tap on a pin to view details of the location.
7. To get navigation directions to a saved location, tap on the pin, then "i" button.

## Dependencies <a name="dependencies"></a>
This project uses the following dependencies:
- Parse SDK: A powerful backend service for mobile applications, used for storing location data.
- UIKit: Apple's framework for building user interfaces.
- MapKit: Apple's framework for displaying maps and managing map-based interfaces.
  
