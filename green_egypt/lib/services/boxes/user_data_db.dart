import 'package:green_egypt/services/console_message.dart';
import 'package:hive/hive.dart';

class UserDataBox {
  /**
   * Accessable keys through level of Class .
   */
  String _key_userName = 'username';
  String _key_userImageUrl = 'userImageUrl';
  String _key_userEmail = 'userEmail';
  String _key_userPhoneNumber = 'phoneNumber';
  String _key_userLoggedIn = 'loggedIn';
  String _key_userCredintial = 'userCredintial';
  String _key_userId = 'userId';
  String _key_apply_review_before = "apply_review_before";
  String _key_userTotalPoints = "user_total_points";
  String _key_userSavedCo2 = "user_saved_co2";
  String _key_userTotalRecycledItems = "user_total_recycled_items";
  String _key_recycledPlasticItemsNumber = 'recycled_plastic_number';
  String _key_recycledCansItemsNumber = 'recycled_cans_number';

  late int _number_of_total_plastic_items;
  late int _number_of_total_cans_items;
  late int _number_of_total_points;

  /**
   * Singleton Class .
   */
  UserDataBox._privateConstructor();

  static final UserDataBox _instance = UserDataBox._privateConstructor();

  static UserDataBox get instance => _instance;

  // object that used in each and write operation in user  box .
  late Box _userDataBox;

  /***
   * *************************** initialize User Data Box *********************************
   */
  void initiateUserBox() async {
    _userDataBox = await Hive.openBox('userBox');
    _number_of_total_plastic_items = get_recycledPlasticItemsNumber();
    _number_of_total_cans_items = get_recycledPlasticItemsNumber();
    _number_of_total_points = get_totalPoints();
    ConsoleMessage.successMessage('User box opened');
  }

  /***
   * *************************** User Name Operations *********************************
   */
  void put_userName({required String userName}) async {
    await _userDataBox.put(_key_userName, userName);
  }

  String get_userName() {
    return _userDataBox.get(_key_userName, defaultValue: "");
  }

  /**
   * ************************** User image url operations *******************************
   */
  void put_userImageUrl({required String userImageUrl}) async {
    await _userDataBox.put(_key_userImageUrl, userImageUrl);
  }

  String get_userImageUrl() {
    return _userDataBox.get(_key_userImageUrl, defaultValue: "");
  }

  /**
   * ******************************* user email operations *********************************
   */
  void put_userEmail({required String email}) async {
    await _userDataBox.put(_key_userEmail, email);
  }

  String get_email() {
    return _userDataBox.get(_key_userEmail, defaultValue: "");
  }

  /**
   * **************************** user phone number operations **********************************
   */
  void put_userPhoneNumber({required String phoneNumber}) async {
    await _userDataBox.put(_key_userPhoneNumber, phoneNumber);
  }

  String get_phoneNumber() {
    return _userDataBox.get(_key_userPhoneNumber, defaultValue: "");
  }

  /**
   * ************************** logged in bool operations ***************************************
   */
  void put_loggedInBool({required bool loggedIn}) async {
    await _userDataBox.put(_key_userLoggedIn, loggedIn);
  }

  bool get_loggedInBool() {
    return _userDataBox.get(_key_userLoggedIn, defaultValue: false);
  }

  /**
   * ***************************** user credintial operations ********************************
   */
  void put_userCredintial({required String credintail}) async {
    await _userDataBox.put(_key_userCredintial, credintail);
  }

  String get_credintial() {
    return _userDataBox.get(_key_userCredintial, defaultValue: "");
  }

  /**
   *  **************************** user id operations ***********************************
   */
  void put_userId({required String id}) async {
    await _userDataBox.put(_key_userId, id);
  }

  String get_id() {
    return _userDataBox.get(_key_userId, defaultValue: "");
  }

  /**
   *  **************************** Apply review before Boolean operations ***********************************
   */
  void put_applyReviewBefore({required bool apply}) async {
    await _userDataBox.put(_key_apply_review_before, apply);
  }

  bool get_applyReviewBeforeBool() {
    return _userDataBox.get(_key_apply_review_before, defaultValue: false);
  }

  /**
   *  **************************** Earned cash operations ***********************************
   */
  void put_newPoints({required int points}) async {
    await _userDataBox.put(_key_userTotalPoints, points + get_totalPoints());
  }

  int get_totalPoints() {
    return _userDataBox.get(_key_userTotalPoints, defaultValue: 0);
  }

  /**
   *  **************************** total Recycled items operations ***********************************
   */
  void put_totalrecycledItems(
    {required int newTotalNumber}) async {
    await _userDataBox.put(_key_userTotalRecycledItems, newTotalNumber);
  }

  int get_recycledItems() {
    return _userDataBox.get(_key_userTotalRecycledItems, defaultValue: 0);
  }

  /**
   *  **************************** recycled plastic items operations ***********************************
   */
  void put_increamentRecycledPasticItemsNumber(
      {required int plasticItemsNumber}) async {
    await _userDataBox.put(_key_recycledPlasticItemsNumber,
        plasticItemsNumber + get_recycledPlasticItemsNumber());
  }

  int get_recycledPlasticItemsNumber() {
    return _userDataBox.get(_key_recycledPlasticItemsNumber, defaultValue: 0);
  }

  /**
   *  **************************** recycled cans items number operations ***********************************
   */
  void put_increamentRecycledCansItemsNumber(
      {required int cansItemsNumber}) async {
    await _userDataBox.put(_key_recycledCansItemsNumber,
        cansItemsNumber + get_recycledCansItemsNumber());
  }

  int get_recycledCansItemsNumber() {
    return _userDataBox.get(_key_recycledCansItemsNumber, defaultValue: 0);
  }

  void put_allUserData(
      {required String id,
      required String name,
      required String email,
      required String imageUrl,
      required String phoneNumber,
      required String credintial,
      required int earned,
      required int savedCo2,
      required int cansItemsNumber,
      required int plasticItemsNumber,
      required int totalRecycledItems,
      required bool reviewedBefore,
      required bool loggedIn}) {
    put_userId(id: id);
    put_userName(userName: name);
    put_userEmail(email: email);
    put_userImageUrl(userImageUrl: imageUrl);
    put_userPhoneNumber(phoneNumber: phoneNumber);
    put_userCredintial(credintail: credintial);
    put_newPoints(points: earned);
    put_increamentRecycledPasticItemsNumber(
        plasticItemsNumber: plasticItemsNumber);
    put_increamentRecycledCansItemsNumber(cansItemsNumber: cansItemsNumber);
    put_totalrecycledItems(newTotalNumber: totalRecycledItems);
    put_applyReviewBefore(apply: reviewedBefore);
    put_loggedInBool(loggedIn: loggedIn);
  }

  void userLoggedOut() {
    put_userId(id: "");
    put_userName(userName: "");
    put_userEmail(email: "");
    put_userImageUrl(userImageUrl: "");
    put_userPhoneNumber(phoneNumber: "");
    put_userCredintial(credintail: "");
    put_newPoints(points: 0);
    put_totalrecycledItems(newTotalNumber: 0);
    put_applyReviewBefore(apply: false);
    put_loggedInBool(loggedIn: false);
  }
}
