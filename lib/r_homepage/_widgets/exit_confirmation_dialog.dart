import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit The Application ?'),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.check),
          label: const Text('Confirm'),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            Navigator.pop(context, false);
          },
          icon: const Icon(Icons.close),
          label: const Text('Cancel'),
        ),
      ],
    );
  }
}
