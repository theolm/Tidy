import 'dart:io';

import 'package:tidy/src/output.dart' as _output;
import 'package:tidy/src/commands.dart' as _commands;

var running = true;
String androidBundle;

void run() {
  running = true;
  while (running) {
    _output.printAppMessage(
        'Esperando por comando para aplicação ${androidBundle}:');
    _commands.parseCommand(stdin.readLineSync());
  }
}
