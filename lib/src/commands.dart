import 'package:tidy/src/generator.dart' as _generator;
import 'package:tidy/src/help.dart' as _help;
import 'package:tidy/src/output.dart' as _output;
import 'package:tidy/src/run.dart' as _run;

void parseCommand(String command) {
  if (command.isEmpty) {
    return;
  }

  var list = command.split(' ').toList();
  switch (list.first) {
    case 'help':
    case 'h':
      _help.executeHelp();
      break;
    case 'generate':
    case 'g':
      if (list.length < 3) {
        _output.printError('Faltando parâmetros');
      } else {
        _generator.generate(list.sublist(1, list.length));
      }
      break;
    case 'q':
    case 'exit':
      _run.running = false;
      break;
    default:
      _output.printError('Comando inválido. help para ajuda.');
  }
}
