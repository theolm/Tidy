import 'dart:io';

final _ANDROID_PACKAGE = 'com/theomota/tidy';

void generateActivity(String fileName) {
  final pwd = Platform.environment["PWD"];
  final androidDefault = 'app/src/main/java';
  final completePath = '$pwd/$androidDefault/$_ANDROID_PACKAGE';

  _generateActivity('$completePath/${fileName}Activity.kt');
  _generateView('$completePath/${fileName}View.kt');
  _generatePresenter('$completePath/${fileName}Presenter.kt');
}

void _generateActivity(String fileName) {
  print(fileName);
}

void _generateView(String fileName) {
  print(fileName);
}

void _generatePresenter(String fileName) {
  print(fileName);
}
