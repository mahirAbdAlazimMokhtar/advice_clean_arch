import 'package:adviser_clean_arch/2_application/screens/advice/cubit_advice_screen.dart';
import 'package:adviser_clean_arch/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '2_application/core/services/theme_service.dart';
import 'di_injection.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const CubitAdvicePageWrapperProvider(),
      );
    });
  }
}
