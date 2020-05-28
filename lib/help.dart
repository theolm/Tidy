import 'package:Tidy/output.dart' as _output;

void executeHelp() {
  _output
      .printAppMessage('g a path/filename => generate Activity/View/Presenter');
  _output
      .printAppMessage('g f path/filename => generate Fragment/View/Presenter');
  _output.printAppMessage('q or exit => quit Tidy');
}
