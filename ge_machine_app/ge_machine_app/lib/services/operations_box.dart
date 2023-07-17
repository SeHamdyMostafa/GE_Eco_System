import 'package:ge_machine_app/features/console_messages.dart';
import 'package:hive/hive.dart';

class OperationsBox {
  /**
   * Create class as Singleton .
   */
  OperationsBox._privateConstructor();

  static final OperationsBox _instance = OperationsBox._privateConstructor();

  static OperationsBox get instance => _instance;

  late Box _operations_box;

  late int lastOperationNumber;

  String _key_operations_box = 'operations_box';
  String _key_lastOperationNumber = 'last_operation_number';

  Future<void> init_OperationsBox() async {
    _operations_box = await Hive.openBox(_key_operations_box);
    lastOperationNumber =
        _operations_box.get(_key_lastOperationNumber, defaultValue: 0)+1;
    ConsoleMessage.printMessage(
        'Last operation number initialized ✔ with : ${lastOperationNumber}');
  }

  Future<void> increamentLastOperationNumber() async {
    await _operations_box.put(_key_lastOperationNumber, ++lastOperationNumber);
  }
}
