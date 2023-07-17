class ConsoleMessage {
   static successMessage(message) {
    print('\n\n############################## \n\n'
        '$message ✔️'
        '\n\n############################## \n\n');
  }

  static errorMessage(message, e) {
    print('****************************************\n\n'
        '$message !! ❌ \n\n'
        '$e \n\n'
        '****************************************\n\n');
  }
}
