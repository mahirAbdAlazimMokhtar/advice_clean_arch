import 'package:adviser_clean_arch/2_application/screens/advice/widgets/bloc_custom_button.dart';
import 'package:adviser_clean_arch/2_application/screens/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
import 'bloc/advice_bloc.dart';
import 'widgets/advice_field.dart';

class BlocAdvicePageWrapperProvider extends StatelessWidget {
  const BlocAdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceBloc(),
      child: const AdviserScreen(),
    );
  }
}

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(child: Center(
              child: BlocBuilder<AdviceBloc, AdviceState>(
                builder: (context, state) {
                  if (state is AdviceInitial) {
                    return Text(
                      'Your Advice is waiting for you!',
                      style: themeData.textTheme.headlineMedium,
                    );
                  }
                  if (state is AdviceStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  } else if (state is AdviceStateLoaded) {
                    return AdviceField(advice: state.advice);
                  } else if (state is AdviceStateError) {
                    return ErrorMessage(message: state.message);
                  }
                  return const SizedBox();
                },
              ),
            )),
            const SizedBox(
                height: 200, child: Center(child: BlocCustomButton()))
          ],
        ),
      ),
    );
  }
}
