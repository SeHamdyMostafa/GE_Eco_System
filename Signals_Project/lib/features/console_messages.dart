class ConsoleMessage {
  static void printMessage(message) {
    print(
      '\n\n'
    '############################# \n\n'
    '\n\n'
    '$message ✔'
    '\n\n'
    '############################# \n\n'
    );

  }

  static void printError(error, e) {
    print('\n\n'
    '************************** \n\n'
    '$error ❌'
    '\n \n'
    '$e'
    '\n\n'
    '************************** \n'
    );
  }
}
