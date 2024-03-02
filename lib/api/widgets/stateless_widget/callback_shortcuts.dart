import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final myCallbackShortcuts = CallbackShortcuts(
  bindings: <ShortcutActivator, VoidCallback>{
    SingleActivator(LogicalKeyboardKey.keyC): () {}
  },
  child: Focus(child: Container()),
);
