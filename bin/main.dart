import 'package:Tidy/output.dart' as _output;
import 'package:Tidy/run.dart' as _run;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    _output.printError('App bundle missing.');
    return;
  }

  _run.androidBundle = arguments[0];
  _run.run();
}
