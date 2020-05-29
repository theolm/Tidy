import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

AnsiPen _blackPen = AnsiPen()..black(bold: true);
AnsiPen _commandPen = AnsiPen()
  ..white(bold: false)
  ..green(bg: true);

AnsiPen _errorPen = AnsiPen()
  ..white()
  ..red(bg: true);

AnsiPen _successPen = AnsiPen()
  ..white(bold: true)
  ..green(bg: true);

void printAppMessage(String message) {
  stdout.writeln(_blackPen(message));
}

void printCommand(String message) {
  stdout.writeln(_commandPen(message));
}

void printError(String message) {
  stdout.writeln(_errorPen(message));
}

void printSuccess(String message) {
  stdout.writeln(_successPen(message));
}
