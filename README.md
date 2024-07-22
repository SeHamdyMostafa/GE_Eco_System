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

<img src = "https://github.com/user-attachments/assets/fe1e5e9b-eef1-403d-95ea-49e0bc7bd341" width = 250 height = 450/>

2- Intro Page

<img src = "https://github.com/user-attachments/assets/e2ae11dc-1c76-44d9-a0e2-08747285f41f" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/f82ad5f4-532c-4b53-bf66-fc7999205538" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/c6571411-0199-47b8-8398-b4f5f536b0e5" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/805a0157-0dc2-4e7b-b004-adb561328e5a" width = 250 height = 450/>

3-Start Page

<img src = "https://github.com/user-attachments/assets/587fc4fd-c45d-43b6-913e-813bf1ee9fb1" width = 250 height = 450/>

4- Register Page 

<img src = "https://github.com/user-attachments/assets/d99e4322-8fec-411b-9059-063923441e4e" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/8c9cb56c-c278-40ea-a1f6-044dfa55f6bc" width = 250 height = 450/>

5-Login Page

<img src = "https://github.com/user-attachments/assets/36ba44d1-7699-4d05-a8ff-00bd23496e89" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/3ee364fb-76ad-494e-9b49-8a7a27b2a021" width = 250 height = 450/>

6-Home Page

<img src = "https://github.com/user-attachments/assets/71d75a3e-8961-4072-9c13-b90334c2572e" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/b364d4c2-89fc-4db0-9c26-c95d388561d2" width = 250 height = 450/><img src ="https://github.com/user-attachments/assets/86aaff4b-22ef-485a-bb9d-c7539e47cf5d" width = 250 height = 450/>

7-Scan Qr Code Page

<img src = "https://github.com/user-attachments/assets/e5721edb-04a7-44aa-a9a3-bcbacbcf302a" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/3ff8321b-71b1-4733-8b9b-bcefa294f7b6" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/fc343606-9fa2-409b-8e8d-9051e6b10a4b" width = 250 height = 450/>


8-Transaction Screen

<img src = "https://github.com/user-attachments/assets/6da3e400-0184-4c8f-b749-d5cdba71aa52" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/973fdb8b-14f3-474e-9f53-e069c554506e" width = 250 height = 450/>

9-More Page

<img src = "https://github.com/user-attachments/assets/9665674c-69bd-4515-a5a3-2cdb51348e9c" width = 250 height = 450/>

10- Edit Profile Page

<img src = "https://github.com/user-attachments/assets/449e912c-1816-4d92-ad68-2ba9c4e8f3f1" width = 250 height = 450/>

11- Get Cash Page

<img src = "https://github.com/user-attachments/assets/b1231dce-3645-4ffe-8543-d257844111aa" width = 250 height = 450/>

12 - Contact Us Page

<img src = "https://github.com/user-attachments/assets/9625b5b7-7e88-437d-a635-0c32205fea33" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/b267929a-5b8b-494f-8364-e837b4bda2f3" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/815dc67d-4cee-40b4-ace1-ac1d5282e1fe" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/fa25e1eb-18f2-4e5a-8331-65f57412a6ba" width = 250 height = 450/>

13- localization Page

<img src = "https://github.com/user-attachments/assets/a1646fff-b9fb-49ac-98fe-d20c95a42432" width = 250 height = 450/>

14-Theme Page

<img src = "https://github.com/user-attachments/assets/a8aec889-a48f-4aee-b7f6-361cf751f7aa" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/4370f79a-77d8-49d5-9dbe-f9f3c6c483ca" width = 250 height = 450/>

15-Feedback Page

<img src = "https://github.com/user-attachments/assets/980c07d6-22f3-4da7-8bab-a38ab4512d7d" width = 250 height = 450/><img src = "https://github.com/user-attachments/assets/eb6f82a7-b429-4fe0-b38d-ec1c13aa3f50" width = 250 height = 450/>


