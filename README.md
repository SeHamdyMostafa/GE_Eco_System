# GE_Eco_System
🏭 Green Egypt Eco System :
this git repo contain all software that we use inside our GE Eco System as :

Green Egypt user app 📱 : this application that contain all user info “User account , user points , number of recycled items and history of all transactions that user implement inside our system”.


Green Egypt Screen app 💻 : this application is used to interact with all user actions and tracking number and type of items that user put inside our GE Machine and at last generate qrcode that user scan to take his / her points .

Green Egypt Camera app 📸 : we use camera with tflite model to detect classify the type of item that user put in front of the machine to open the hole of the item or refuse to take it if it neigther plastic nor cans .

GE Signals app 📶 : this app contain and test all signals that camera send to arduino and check how the arduino interact and handle these signals .

📗 Green Egypt :
Graduation Project for Software Engineering Section 2023 FCI Menofia with Dr / Eman Elmesalhy “Project Advisor 👩‍⚖️” .
Recycling , the idea that we build our project depending on , Green Egypt support recycling idea by Giving users cash back 💵 with each item they recycle .
** Members of Team :
Mariam Ahmad Elsheikh “Team Leader” .
Mohamad amgad elsaid ”Technical leader & Repository Admin ”.
Hamdy Mostafa mahmoud “Flutter developer & Documentation Admin” .
Salah ayman Eteam “Flutter developer” .
Alaa mohamad Hammad “Flutter Developer” .
mahmoud Shady "Flutter Developer".
Mohamad samy alansary "Flutter Developer".
🗺 Implementation Map in Green Egypt :
📅 “Implement App Localization” 19/04/2023 .
Eng / Alaa Hammad Added Arabic language to application , now application support ‘ar - en’ languages and also language switching but without storing last option .

Eng / Amgad implemented storing last choosen language option and fix language transition mark ✔ .

📅 11/05/2023 - “Start working on Qrcode scanning” .
Eng / Amgad implemented qrcode scanning and handling scan the same qrcode multiple times .
📅 15/05/2023 - “Contact Us Page Added” .
Eng / Hamdi implemented “Contact Us Page”
which Allow the user to contact us by chat us , email us and call us.
Allow the user message us.
📅 16/05/2023 - “Finish Qrcode scanning and storing transactions in Transaction Page” .
Eng / Amgad implemented Saving qrcode on local storage and also showing it on transaction page .
📅 25/05/2023 - “Add Ultra sonic to Machine and implement it's code” .
Eng / Amgad implemented Ultrasonic code and handle sending signals to screen only if the item putted inside machine .
📅 19/06/2023 - “Bluetooth Auto reconnect stablished” .
Eng / Amgad implemented "Camera and Screen Bluetotooth auto Reconnect" to make system more reliable and get rid of restarting applications over head.
📅 20/06/2023 - “Transactions Animations implmented” .
Eng / salah implemented "Modern Success Transaction animation".

Eng / amgad implemented "Modern Failed Transaction animation".

📅 20/06/2023 - “Header oF Transaction page Added” .
Eng / Hamdi implemented "Header oF Transaction page" which show graphs that visually show how user performed “in one Week , or in one Month , or in one year”.
📅 22/06/2023 - “Get Cash Page Added” .
Eng / Amgad implemented "Get cash page" which allow user to convert his/het points to cash Using Qrcode :
User get his/het qrcode .
Admin scan this qrcode using GE Admin App .
GE Admin App show Amount of cash that must be given to user .
After finishing this process , points transfered from user account to admin account - and user got his / her points .
📅 26/06/2023 - “Responsive Of Application Added” .
Eng / Hamdi added the level application response
📅 31/06/2023 - “Theme Of Application Completed” .
Eng / Hamdi added Theme To Get Cash Page
📅 04/07/2023 - “Edit Of Home page” .
Eng / Hamdi added the function of showing points in the header of the main page.
📅 5/07/2023 - “Edit Of App Localization” .
Eng / Hamdi added Localization in :
header of transaction page
Get cash page.
QR code scan page.
📅 13/07/2023 - "Object Detection - AI" implemented by Salah Ayman and AMG :
Tried "GPT4" solution : TFLite & Tflite_flutter_helper but not worked and cause many errors . Tried Google Ml Kit project : https://pub.dev/packages/google_mlkit_object_detection and with copying number of blocks of code from it ,it gives us satisfying results .

📅 13/07/2023 "Bluetooth Controller implemented" by Salah Ayman and AMG :
as we need to implement connection between all eco-system components , we implemented bluetooth cotroller that responsible for sending all Signals depending on detection result .

📅 14/07/2023 "Camera detection and Sending Signals implmeneted ✅ :
Eng / Amgad implemented "Camera Detection and Bluetooth signals sending to Arduino".
this task implmeneted by adding google_ml_kit package to project and handling detection results .
Future work 'Adding transactions cloud backup".
Future work 'will be implemented by shady - Alaa and AMG': need to create our custom tflite model "bottle detection or color detection".
