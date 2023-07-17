import 'package:get/get.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:hive/hive.dart';

class TransactionsBox extends GetxController {
  TransactionsBox._privateConstructor();

  static final TransactionsBox _instance =
      TransactionsBox._privateConstructor();

  static TransactionsBox get instance => _instance;

  // object that used in each and write operation in user  box .
  late Box _transactiobsBox;

  String _key_transactionsBoxName = 'transactions_box_name';

  List<Map<dynamic, dynamic>> allStoredTransactions = [];

  /***
   * *************************** initialize User Data Box *********************************
   */
  Future<void> init_TransactionsBox() async {
    _transactiobsBox = await Hive.openBox('_key_transactionsBoxName');
    loadAllStoredTransactions();
  }

  void loadAllStoredTransactions() {
    allStoredTransactions = _transactiobsBox.keys.map((key) {
      Map<dynamic, dynamic> item = _transactiobsBox.get(key);
      return item;
    }).toList();
    ConsoleMessage.successMessage('stored transactions loaded in memory');
  }

  void addTransaction(Map<String, dynamic> newTransactionData) async {
    await _transactiobsBox.add(newTransactionData);
    loadAllStoredTransactions();
    update();
  }
}
