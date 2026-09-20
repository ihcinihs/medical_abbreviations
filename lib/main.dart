import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/search_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: MedicalAbbreviationApp()));
}

class MedicalAbbreviationApp extends StatelessWidget {
  const MedicalAbbreviationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: '\u533b\u7642\u7565\u8a9e',
      theme: CupertinoThemeData(
        primaryColor: AppColors.nihBlue,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
        barBackgroundColor: CupertinoColors.systemBackground,
      ),
      home: SearchScreen(),
    );
  }
}
