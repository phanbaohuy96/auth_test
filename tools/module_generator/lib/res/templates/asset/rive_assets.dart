import '../../../common/definations.dart';

const riveAssetsRes = '''///This file is automatically generated.
///DO NOT EDIT, all your changes would be lost.
///dart run module_generator:generate_asset <path-to-root-preview-image>
part of 'assets.dart';

class RiveAssets {
  RiveAssets();$contentKey
}
''';

final riveAssetsArtboardRes = '''class ${classNameKey}Artboard {
  ${classNameKey}Artboard();

  final String name = \'$artboardKey\';

  final ${classNameKey}Inputs inputs = ${classNameKey}Inputs();

  final ${classNameKey}States states = ${classNameKey}States();

  final ${classNameKey}Machines machines = ${classNameKey}Machines();
}
''';

const riveAssetsStatesRes = '''class ${classNameKey}States {
  ${classNameKey}States();$contentKey
}
''';

const riveAssetsInputsRes = '''class ${classNameKey}Inputs {
  ${classNameKey}Inputs();$contentKey
}
''';

const riveAssetsMachinesRes = '''class ${classNameKey}Machines {
  ${classNameKey}Machines();$contentKey
}
''';
