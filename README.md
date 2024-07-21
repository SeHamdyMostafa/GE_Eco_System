# Green Egypt Repository

## 🏭 Green Egypt Eco System :

- this git repo contain all software that we use inside our GE Eco System as :

1. Green Egypt user app 📱 : this application that contain all user info “User account , user points , number of recycled items and history of all transactions that user implement inside our system”.
    
    <img src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP5O-mAsZ4z3ArULmiUduJum8edRINshEO7TR7s5sj2_2TCYY3jIz1KH3WI1nD96TFnzV5NWrvrK_3eCgl3ra5tUz3ziMNQkuPA_Fh-yZ-lFja4HZqI44arl2QQ3MGPrneVPTXTAk5WFaj_Rv8g3J2x6HT0A-l4axxwLZfRvkeAyAWILJoJJbEPkXf/s1600/GE%20Logo.png" width = 125 height = 125/>
    
2. Green Egypt Screen app 💻 : this application is used to interact with all user actions and tracking number and type of items that user put inside our GE Machine and at last generate qrcode that user scan to take his / her points .

3. Green Egypt Camera app 📸 : we use camera with tflite model to detect classify the type of item that user put in front of the machine to open the hole of the item or refuse to take it if it neigther plastic nor cans .

4. GE Signals app 📶 : this app contain and test all signals that camera send to arduino and check how the arduino interact and handle these signals . 

# 📗 Green Egypt :

- Graduation Project for Software Engineering Section 2023 FCI Menofia with Dr / Eman Elmesalhy “Project Advisor 👩‍⚖️” .
- Recycling , the idea that we build our project depending on ,
 Green Egypt support recycling idea by Giving users cash back 💵 with each item they recycle .

### ** Members of Team :

1. Mariam Ahmad Elsheikh “Team Leader” .
2. Mohamad amgad elsaid ”Technical leader ”.
3. Hamdy Mostafa mahmoud “Flutter developer & Documentation Admin” .
4. Salah ayman Eteam “Flutter developer” .
5. Alaa mohamad Hammad “Flutter Developer” .
6. mahmoud Shady "Flutter Developer".
7. Mohamad samy alansary "Flutter Developer".

# 🗺 Implementation Map in Green Egypt :

## 📅 “Implement App Localization” 19/04/2023 .

- Eng / Alaa Hammad Added Arabic language to application , now application support ‘ar - en’ languages and also language switching but without storing last option .
 
- Eng / Amgad implemented storing last choosen language option and fix language transition mark ✔ .

## 📅 11/05/2023 - “Start working on Qrcode scanning”  .

- Eng / Amgad implemented qrcode scanning and handling scan the same qrcode multiple times .

## 📅 15/05/2023 - “Contact Us Page Added” .

- Eng / Hamdi  implemented  “Contact Us Page”
  
1. which Allow the user to contact us by chat us , email us and call us.
2. Allow the user message us.

## 📅 16/05/2023 - “Finish Qrcode scanning and storing transactions in Transaction Page”  .

- Eng / Amgad implemented Saving qrcode on local storage and also showing it on transaction page .

## 📅 25/05/2023 -  “Add Ultra sonic to Machine and implement it's code”  .

- Eng / Amgad implemented Ultrasonic code and handle sending signals to screen only if the item putted inside machine .

## 📅 19/06/2023 - “Bluetooth Auto reconnect stablished” .

- Eng / Amgad implemented "Camera and Screen Bluetotooth auto Reconnect" to make system more reliable and get rid of restarting applications over head.

## 📅 20/06/2023 - “Transactions Animations implmented” .

- Eng / salah implemented "Modern Success Transaction animation".

- Eng / amgad implemented "Modern Failed Transaction animation".

## 📅 20/06/2023 - “Header oF Transaction page Added” .

- Eng / Hamdi  implemented "Header oF Transaction page" which show graphs that visually show how user performed “in one Week , or in one Month , or in one year”.

## 📅 22/06/2023 - “Get Cash Page Added” .

- Eng / Amgad implemented "Get cash page" which allow user to convert his/het points to cash Using Qrcode :

1. User get his/het qrcode .
2. Admin scan this qrcode using GE Admin App .
3. GE Admin App show Amount of cash that must be given to user .
4. After finishing this process , points transfered from user account to admin account - and user got his / her points .


## 📅 26/06/2023 - “Responsive Of Application Added” .

- Eng / Hamdi added the level application response

## 📅 31/06/2023 - “Theme Of Application Completed” .

- Eng / Hamdi added Theme To Get Cash Page
  
## 📅 04/07/2023 - “Edit Of Home page” .

- Eng / Hamdi added the function of showing points in the header of the main page.

## 📅 5/07/2023 - “Edit Of App Localization” .

- Eng / Hamdi added Localization :

1. header of transaction page
2. Get cash page.
3. QR code scan page.

## 📅 13/07/2023 - "Object Detection - AI" implemented by Salah Ayman and AMG :
Tried "GPT4" solution : TFLite & Tflite_flutter_helper but not worked and cause many errors .
Tried Google Ml Kit project : https://pub.dev/packages/google_mlkit_object_detection and with copying number of blocks of code from it ,it gives us satisfying results .

## 📅 13/07/2023 "Bluetooth Controller implemented" by Salah Ayman and AMG :
as we need to implement connection between all eco-system components , we implemented bluetooth cotroller that responsible for sending all Signals depending on detection result .

## 📅 14/07/2023 "tflite model "bottle detection or color detection" is added.

## Future work 'Adding transactions cloud backup".

## Mopile App Ui

1- Splash Page

<img src = "https://blogger.googleusercontent.com/img/a/AVvXsEiGbwnLVkeC-ScspujeY9XQG4x4iPa24wO8_XfI2kK80p_zwZ3VJa9tig2zJ9XmsGM2LIZ9nyP6bK20XoxDi2xYAG8jNkXCoqr_0MwD4HW-HtcC-ku8kZuV5d0cj5VIQhpvWwun2_pp_a9ipqVaAfW_eFI9Ang78Z9pB0vEuaQNnNWkIBQnoqhExQLlnaIt=w640-h360" width = 400 height = 200/>

