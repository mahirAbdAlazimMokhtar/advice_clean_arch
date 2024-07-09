import 'package:adviser_clean_arch/2_application/screens/advice/widgets/advice_field.dart';
import 'package:adviser_clean_arch/2_application/screens/advice/widgets/custom_button.dart';
import 'package:adviser_clean_arch/2_application/screens/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';

class AdviserScreen extends StatelessWidget {
  const AdviserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final themeServices = Provider.of<ThemeService>(context).isDarkModeOn;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advice',
          style: themeData.textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: themeServices,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: 
              ErrorMessage(message: 'No advice at the moment'),
              /*AdviceField(
                  advice:
                      'Example Advice - Your Day will be full of good advice!'),*/
              /*CircularProgressIndicator(
                color: themeData.colorScheme.secondary,
              )*/
              /* Text(
                'Your Advice is waiting for you!',
                style: themeData.textTheme.headlineMedium,
              ),*/
            )),
            SizedBox(height: 200, child: Center(child: CustomButton()))
          ],
        ),
      ),
    );
  }
}
