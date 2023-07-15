# PiFinance-iOS
An iOS application developed in SwiftUI to create youtube video tutorial to guide the iOS developer to speed their SwiftUI skills.
This app helps to connect non-organized lender and buyers across the world to exchange the money with their own terms &amp; conditions

# Key Decisions

Support iOS 16 & Above
Support only portrait mode
Suppose to be multi module application
Support Localization
Dynamic Theme
Support Deeplinks

#Frameworks

- Only SwiftUI
- Lottie for animation
- Firebase Authentication for authentication = YET TO BE DONE
- Firestore- to store realtime data = YET TO BE DONE
- Firebase Crashlytics - to log crash details = YET TO BE DONE
- Stripe for payment - To make online payment = YET TO BE DONE


# Multi Module application

- PiModel to hold all data files
- PiUI to hold reusable UI components
- PiShared to hold the common page between different module
- PiAuthentication to handle authentication
- PiBorrower to hold borrower business logics
- PiLender to hold lender businss logics and screens
- PiNavigation to handle the navigation
- PiFinance the main application connects all the module

