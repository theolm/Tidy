import 'dart:io';

import 'output.dart' as _output;
import 'run.dart' as _run;
import 'templates.dart' as _template;

void generate(List<String> commands) {
  switch (commands[0]) {
    case 'a':
      if (commands.length < 2) {
        _output.printError('Comando inválido.');
      } else {
        activity(commands[1]);
      }
      break;
    case 'f':
      break;
    default:
      _output.printError('Comando inválido.');
  }
}

void activity(String filePath) {
  final fileName = filePath.split('/').last;
  final pwd = Platform.environment['PWD'];
  final androidDefault = 'app/src/main/java';
  final bundle = _run.androidBundle.replaceAll('.', '/');
  final completePath = '$pwd/$androidDefault/$bundle';

  final activity = _createFile('${completePath}/${filePath}Activity.kt');
  final view = _createFile('${completePath}/${filePath}View.kt');
  final presenter = _createFile('${completePath}/${filePath}Presenter.kt');

  _writeToFile(
      _template.activityTemplate(fileName, _run.androidBundle), activity);
  _writeToFile(
      _template.presenterTemplate(fileName, _run.androidBundle), presenter);
  _writeToFile(_template.viewTemplate(fileName, _run.androidBundle), view);

  layout('activity_$fileName');
}

void layout(String fileName) {
  final pwd = Platform.environment['PWD'];
  final androidResDefault = 'app/src/main/res/layout';
  final completePath = '$pwd/$androidResDefault';

  final layout = _createFile('${completePath}/${fileName.toLowerCase()}.xml');
  _writeToFile(_template.layoutTemplate(), layout);
}

File _createFile(String path) {
  final file = File(path);
  file.createSync(recursive: true);
  _output.printSuccess('Arquivo gerado com sucesso: $path');
  return file;
}

void _writeToFile(String content, File file) {
  file.writeAsStringSync(content);
}
