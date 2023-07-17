import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:lottie/lottie.dart';
import '../boxes/user_data_db.dart';

class FirebaseCustomServices {
  /**
   * Make class as Singleton .
   */
  FirebaseCustomServices._privateConstructor();

  static final FirebaseCustomServices _instance =
      FirebaseCustomServices._privateConstructor();

  static FirebaseCustomServices get instance => _instance;

  final String _key_collection_user_logs = 'user_logs';
  final String _key_userId = "user_id";
  final String _key_userName = "user_name";
  final String _key_userEmail = "user_email";
  final String _key_userImageUrl = "userImageUrl";
  final String _key_userPhoneNumber = "phone_number";
  final String _key_userEarnedCash = "earned_cash";
  final String _key_userSavedCo2 = "saved_co2";
  final String _key_totalRecycledItems = "total_recycled_items";
  final String _key_recycledCansItems = "recycled_cans_items";
  final String _key_recycledPlasticItems = "recycled_plastic_items";
  final String _key_userReviewBefore = "review_before";
  final String _key_userCredintial = "user_credintial";

  /**
   * After logging with facebook or google , this method get user credintial data 
   * and upload it to firestore .
   */
  Future<void> uploadUserDataToFirestore_thenStoreDataLocally(
      {required String userName,
      required String userEmail,
      required String userImageUrl,
      required String phoneNumber,
      int earnedCash = 0,
      int savedCo2 = 0,
      int totalRecycledItems = 0,
      int plasticItemsNumber=0,
      int cansItemsNumber=0,
      bool reviewBefore = false,
      String credintial = "normal_user"}) async {
    var user_id;
    try {
      await FirebaseFirestore.instance
          .collection(_key_collection_user_logs)
          .add({
        _key_userName: userName,
        _key_userEmail: userEmail,
        _key_userImageUrl: userImageUrl,
        _key_userPhoneNumber: phoneNumber,
        _key_userEarnedCash: earnedCash,
        _key_userSavedCo2: savedCo2,
        _key_totalRecycledItems: totalRecycledItems,
        _key_recycledPlasticItems: plasticItemsNumber,
        _key_recycledCansItems:cansItemsNumber,
        _key_userReviewBefore: reviewBefore,
        _key_userCredintial: credintial
      }).then((document) async {
        user_id = document.id;
        /**
             * update user data on firestore by adding id .
             */
        await FirebaseFirestore.instance
            .collection(_key_collection_user_logs)
            .doc(document.id)
            .update({_key_userId: document.id});
      });

      /**
                   * add user data into UserDataModel
                   */
      UserDataBox.instance.put_allUserData(
          id: user_id,
          name: userName,
          email: userEmail,
          imageUrl: userImageUrl,
          phoneNumber: phoneNumber,
          credintial: credintial,
          earned: earnedCash,
          totalRecycledItems: totalRecycledItems,
          plasticItemsNumber: plasticItemsNumber,
          cansItemsNumber: cansItemsNumber,
          savedCo2: savedCo2,
          loggedIn: true,
          reviewedBefore: reviewBefore);
    } catch (e) {
      CustomToast.showRedToast(messsage: "error : ${e.toString()}");
    }
  }

  /**
   * When user try to login with user name and password
   */
  Future<void> signInUser_withEmailAndPassword_thenStoreDataLocally(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      /**
                 * Sign in with email and password 
                 */
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        /**
                   * Fetch user data from FireStore .
                   */
        final result = await FirebaseFirestore.instance
            .collection(_key_collection_user_logs)
            .where(_key_userEmail, isEqualTo: emailController.text)
            .get()
            .then((value) async {
          /**
               * Get user document and store it in userDocument variable .
               */
          var userDocument = value.docs.map((e) => e.data()).first;
          /**
                 * add data to user data box .
                 */
          UserDataBox.instance.put_allUserData(
              id: userDocument[_key_userId],
              name: userDocument[_key_userName],
              email: userDocument[_key_userEmail],
              imageUrl: userDocument[_key_userImageUrl],
              phoneNumber: userDocument[_key_userPhoneNumber],
              credintial: userDocument[_key_userCredintial],
              earned: userDocument[_key_userEarnedCash],
              loggedIn: true,
              totalRecycledItems: userDocument[_key_totalRecycledItems],
              plasticItemsNumber: userDocument[_key_recycledPlasticItems],
              cansItemsNumber: userDocument[_key_recycledCansItems],
              reviewedBefore: userDocument[_key_userReviewBefore],
              savedCo2: userDocument[_key_userSavedCo2]);
        });
      });
    } catch (e) {
      CustomToast.showRedToast(messsage: 'error : ${e.toString()}');
    }
  }

  /**
           * Register new User into firebase Auth
           */
  Future<void> registerNewUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String credintial,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredintial) async {
        String userName = "${firstName} ${lastName}";
        /**
                       * Store user data in fireStore , but without id : 
                       */

        await uploadUserDataToFirestore_thenStoreDataLocally(
          userName: userName,
          credintial: credintial,
          phoneNumber: phoneNumber,
          userEmail: email,
          userImageUrl:
              "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
        );
      });
    } on FirebaseException catch (e) {
      CustomToast.showRedToast(
          messsage: 'account already exist , just login !!');
      Get.back();
      throw FirebaseException(
          plugin: 'this account is already exist !! , login Directly');
    }
  }

  void showLoadingIndicator({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      },
    );
  }

  /**
   * this method is used to remove loading indicator .
   */
  void removeLoadingIndicator() {
    Get.back();
  }

  /**
   * to show success animation after any success proccess .
   */
  void showSuccessAnimation_thenNavigateToHomePage(
      {required BuildContext context}) {
    /**
     * show login Success Animation :
     */
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            /**
                        * Remove Success Animation
                        */
            Get.back();
            /**
                         * Navigate to Home Screen 
                         */
            Get.offAllNamed(PagesNames.homePage);
          });
          return Padding(
            padding: const EdgeInsets.all(36.0),
            child: Lottie.asset('assets/animated_vectors/login_success.json',
                repeat: false),
          );
        });
  }



  /**
   * **************************** Google Auth methods section *******************************
   */
  /**
   * this method is used to access user with google account data if the user is logged before .
   * 
   * if the user logging for first time , this method will call access_withGoogle_firstTime() .
   * which is the below method 👇👇.
   */
  Future<void> access_withGoogle_thenStoreDataLocally(
      {required UserCredential userCredential,
      required BuildContext context}) async {
    try {
      showLoadingIndicator(context: context);
      final document = await FirebaseFirestore.instance
          .collection(_key_collection_user_logs)
          .where(_key_userEmail, isEqualTo: userCredential.user!.email)
          .get();

      ConsoleMessage.successMessage(
          'user document data : ${document.docs.first}');

      /**
         * if there is no errors ✔ , it mean that this user account is registered before on firestore,
         * so get account data in map and then store it in UserDataModel .
         * then navigate to HomePage
         */
      var userData = document.docs.map((e) => e.data()).first;
      /**
           * Store fetched data in user data box .
           */
      ConsoleMessage.successMessage(
          "signed user name : ${userData[_key_userName]}");

      UserDataBox.instance.put_allUserData(
          id: userData[_key_userId],
          name: userData[_key_userName],
          email: userData[_key_userEmail],
          imageUrl: userData[_key_userImageUrl],
          phoneNumber: userData[_key_userPhoneNumber],
          credintial: userData[_key_userCredintial],
          earned: userData[_key_userEarnedCash],
          savedCo2: userData[_key_userSavedCo2],
          totalRecycledItems: userData[_key_totalRecycledItems],
          plasticItemsNumber: userData[_key_recycledPlasticItems],
          cansItemsNumber: userData[_key_recycledCansItems],
          loggedIn: true,
          reviewedBefore: userData[_key_userReviewBefore]);
      removeLoadingIndicator();
      showSuccessAnimation_thenNavigateToHomePage(context: context);
    } catch (e) {
      ConsoleMessage.errorMessage(
          'Account not logged before , call access_withGoogle_firstTime_thenStoreDataLocally()',
          e.toString());
      await access_withGoogle_firstTime_thenStoreDataLocally(
          userCredintial: userCredential, context: context);
    }
  }
  /**
   * this method is used to sign in user with google first first time with default data .
   */
  Future<void> access_withGoogle_firstTime_thenStoreDataLocally(
      {required UserCredential userCredintial,
      required BuildContext context}) async {
    showLoadingIndicator(context: context);
    ConsoleMessage.successMessage(
        'user first time google account with : ${userCredintial.user!.email} \n name : ${userCredintial.user!.displayName} \n phoneNumber : ${userCredintial.user!.phoneNumber} \n imageUrl : ${userCredintial.user!.photoURL}');
    FirebaseCustomServices.instance
        .uploadUserDataToFirestore_thenStoreDataLocally(
            userName: userCredintial.user!.displayName!,
            userEmail: userCredintial.user!.email!,
            userImageUrl: userCredintial.user!.photoURL!,
            phoneNumber: userCredintial.user!.phoneNumber ?? "")
        .then((value) {
      ConsoleMessage.successMessage(
          'signed user name : ${userCredintial.user!.displayName!}');
      removeLoadingIndicator();
      showSuccessAnimation_thenNavigateToHomePage(context: context);
    });
  }


  /**
   * ***************************** Facebook auth methods section ******************************
   */

  /**
   * this method is used to access user with google account data if the user is logged before .
   * 
   * if the user logging for first time , this method will call access_withGoogle_firstTime() .
   * which is the below method 👇👇.
   */
  Future<void> access_withFacebook_thenStoreDataLocally(
      {required Map<String,dynamic> userCredential,
      required BuildContext context}) async {
    try {
      showLoadingIndicator(context: context);
      final document = await FirebaseFirestore.instance
          .collection(_key_collection_user_logs)
          .where(_key_userEmail, isEqualTo: userCredential['email'])
          .get();

      ConsoleMessage.successMessage(
          'user document data : ${document.docs.first}');

      /**
         * if there is no errors ✔ , it mean that this user account is registered before on firestore,
         * so get account data in map and then store it in UserDataModel .
         * then navigate to HomePage
         */
      var userData = document.docs.map((e) => e.data()).first;
      /**
           * Store fetched data in user data box .
           */
      ConsoleMessage.successMessage(
          "signed user name : ${userData[_key_userName]}");

      UserDataBox.instance.put_allUserData(
          id: userData[_key_userId],
          name: userData[_key_userName],
          email: userData[_key_userEmail],
          imageUrl: userData[_key_userImageUrl],
          phoneNumber: userData[_key_userPhoneNumber],
          credintial: userData[_key_userCredintial],
          earned: userData[_key_userEarnedCash],
          savedCo2: userData[_key_userSavedCo2],
          totalRecycledItems: userData[_key_totalRecycledItems],
          plasticItemsNumber: userData[_key_recycledPlasticItems],
          cansItemsNumber: userData[_key_recycledCansItems],
          loggedIn: true,
          reviewedBefore: userData[_key_userReviewBefore]);
      removeLoadingIndicator();
      showSuccessAnimation_thenNavigateToHomePage(context: context);
    } catch (e) {
      ConsoleMessage.errorMessage(
          'Account not logged before , call access_withGoogle_firstTime_thenStoreDataLocally()',
          e.toString());
      await access_withFacebook_firstTime_thenStoreDataLocally(
          userCredintial: userCredential, context: context);
    }
  }
  /**
   * this method is used to sign in user with google first first time with default data .
   */
  Future<void> access_withFacebook_firstTime_thenStoreDataLocally(
      {required Map<String,dynamic> userCredintial,
      required BuildContext context}) async {
    showLoadingIndicator(context: context);
    ConsoleMessage.successMessage(
        'user first time google account with : ${userCredintial['email']} \n name : ${userCredintial['name']} \n phoneNumber : empty because this is facebook \n imageUrl : ${userCredintial['picture']['data']['url']}');
    FirebaseCustomServices.instance
        .uploadUserDataToFirestore_thenStoreDataLocally(
            userName: userCredintial['name'],
            userEmail: userCredintial['email'],
            userImageUrl: userCredintial['picture']['data']['url'],
            phoneNumber: "")
        .then((value) {
      ConsoleMessage.successMessage(
          'signed user name : ${userCredintial['name']}');
      removeLoadingIndicator();
      showSuccessAnimation_thenNavigateToHomePage(context: context);
    });
  }


  /**
   * ****************************** Edit user firestore data section ******************************
   */

  /**
   * method used in edit user data info page to update his/her user name in firststore .
   */
  Future<void> updateUserName(
      {required BuildContext context, required String newName}) async {
    UserDataBox.instance.put_userName(userName: newName);
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: DefaultColors.defaultGreen),
        );
      },
    );
    try {
      await FirebaseFirestore.instance
          .collection(_key_collection_user_logs)
          .doc(UserDataBox.instance.get_id())
          .update({_key_userName: newName});
    } catch (e) {
      CustomToast.showRedToast(messsage: 'error : ${e.toString()}');
    }
    Get.back();
  }
  /**
   * method used in edit user data info page to update his/her phone number in firststore .
   */
  Future<void> updatePhoneNumber(
      {required BuildContext context, required String phoneNumber}) async {
    UserDataBox.instance.put_userPhoneNumber(phoneNumber: phoneNumber);
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: DefaultColors.defaultGreen),
        );
      },
    );
    await FirebaseFirestore.instance
        .collection(_key_collection_user_logs)
        .doc(UserDataBox.instance.get_id())
        .update({_key_userPhoneNumber: phoneNumber});
    Get.back();
  }


}
