import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyActionsAndShortcuts extends StatelessWidget {
  final String title;

  const MyActionsAndShortcuts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(shortcuts: {
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
          CopyIntent(),
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
          SelectAllIntent(),
      LogicalKeySet(LogicalKeyboardKey.escape): ClearIntent()
    }, child: CopyableTextField(title: title));
  }
}

class CopyableTextField extends StatefulWidget {
  final String title;

  const CopyableTextField({super.key, required this.title});

  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Actions(
        dispatcher: LoggingActionsDispatcher(),
        actions: <Type, Action<Intent>>{
          CopyIntent: CopyAction(controller: controller),
          SelectAllIntent: SelectAllAction(controller: controller),
          ClearIntent: ClearAction(controller: controller),
        },
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: Center(
              child: Row(children: [
                Spacer(),
                Expanded(child: TextField(controller: controller)),
                IconButton(
                    icon: Icon(Icons.copy),
                    onPressed:
                        Actions.handler<CopyIntent>(context, CopyIntent())),
                IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: Actions.handler<SelectAllIntent>(
                        context, SelectAllIntent())),
                Spacer(),
              ]),
            ),
          );
        }));
  }
}

class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, RawKeyEvent event) {
    final result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}

class LoggingActionsDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(covariant Action<Intent> action, covariant Intent intent,
      [BuildContext? context]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);
    return null;
  }

  @override
  (bool, Object?) invokeActionIfEnabled(
      covariant Action<Intent> action, covariant Intent intent,
      [BuildContext? context]) {
    print('___Action invoked: $action($intent) from $context');
    return super.invokeActionIfEnabled(action, intent, context);
  }
}

class ClearAction extends Action<ClearIntent> {
  final TextEditingController controller;

  ClearAction({required this.controller});

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();

    return null;
  }
}

class SelectAllAction extends Action<SelectAllIntent> {
  final TextEditingController controller;

  SelectAllAction({required this.controller});

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    return controller.selection = controller.selection.copyWith(
        baseOffset: 0,
        extentOffset: controller.text.length,
        affinity: controller.selection.affinity);
  }
}

class ClearIntent extends Intent {}

class SelectAllIntent extends Intent {}

class CopyAction extends Action<CopyIntent> {
  final TextEditingController controller;

  CopyAction({required this.controller});
  @override
  Object? invoke(covariant CopyIntent intent) {
    final String selectedString = controller.text.substring(
        controller.selection.baseOffset, controller.selection.extentOffset);
    return Clipboard.setData(ClipboardData(text: selectedString));
  }
}

class CopyIntent extends Intent {}
