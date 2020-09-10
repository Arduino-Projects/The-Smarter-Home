# The Smarter Home - McHacks VII - Winner: Top 6 Hacks
A smart home system that is simpler, cheaper, and more reliable.


# What Is It
- A smart home system that allows you to control differnet devices(ie. lights, locks, doorbells) through an app
- Both software(iOS App) and hardware(nodeMCU and Arduino) made from scratch


# How does it work?
It's a three part system.  
1 - App (Used to control a Firebase RT database, and show popup notifications for changes in the database)  
2 - Hub Device(Created with and Arduino and Node-MCU. Uses RF frequencies to update all of the individual devices. The nodeMCU gets this data from the firebase database)  
3 - Individual Devices(These are the devices which communicate with the hub through RF, and perform actual actions)  
 

# What makes it unique
- By using only one central hub device with all of the fancy electronics needed for internet and server connectivity, while the other numerous devices use cheaper RF Radios, The Smarter Home is significantly cheaper than other Smart Home Solutions  
- One central hub device also significantly reduces the chances of unwanted users and illegal hackers  
- With the native swift iOS app, along with the super simple connection process between devices, The Smarter Home is EXTREMELY simple to setup and use  


# Team Members
Araad Shams


# Important Folders
Arduino Files contains the Hub and Individual device files  
Home Control contains all of the app code and information


# Devpost
https://devpost.com/software/the-smarter-home
