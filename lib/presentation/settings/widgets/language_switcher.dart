// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("language".tr()),
      trailing: Text(context.locale.languageCode.toUpperCase()),
      onTap: () {
        Navigator.of(context).restorablePush(dialogBuilder);
      },
    );
  }
}

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(Icons.language),
        title: const Text('Basic dialog title'),
        content: Column(
          children: context.supportedLocales
              .map(
                (e) => ListTile(
                  title: Text(e.languageCode.toUpperCase()),
                  onTap: () {
                    context.setLocale(e);
                    context.pop();
                  },
                ),
              )
              .toList(),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
