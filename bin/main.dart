import 'dart:io';

import 'package:Tidy/generator.dart' as Generator;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    stdout.writeln('Sem comandos de entrada');
    return;
  }

  var method = arguments[0];
  parseCommand(method, arguments);
}

void parseCommand(String method, List<String> arguments) {
  switch (method) {
    case 'help':
    case 'h':
      executeHelp();
      break;
    case 'generate':
    case 'g':
      executeGenerate(arguments);
      break;
    default:
      stdout.writeln('Comando inválido. help para ajuda.');
  }
}

void executeHelp() {
  stdout.writeln('g a path/filename => generate Activity/View/Presenter');
  stdout.writeln('g f path/filename => generate Fragment/View/Presenter');
}

void executeGenerate(List<String> arguments) {
  if (arguments.length < 3) {
    stdout.writeln('Faltando parâmetros.');
    return;
  }

  var generateType = arguments[1];
  var fileName = arguments[2];

  switch (generateType) {
    case 'a':
    case 'activity':
      Generator.generateActivity(fileName);
      break;
    case 'f':
    case 'fragment':
      stdout.writeln('Gera fragmento');
      break;
    default:
      stdout.writeln('Tipo inválido. help para ajuda.');
  }
}
