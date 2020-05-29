import 'package:tidy/src/output.dart' as _output;
import 'package:tidy/src/run.dart' as _run;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    _output.printError('App bundle missing.');
    return;
  }

  _run.androidBundle = arguments[0];
  _run.run();
}
