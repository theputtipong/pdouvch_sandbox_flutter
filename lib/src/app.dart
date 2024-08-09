import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdouvch_sandbox_flutter/src/feats/select_multi_image_picker/select_multi_image_picker.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pdouvch Sandbox Flutter',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('th'),
          ],
          home: SelectMultiImagePicker()),
    );
  }
}
