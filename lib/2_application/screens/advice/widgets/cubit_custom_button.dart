import 'package:adviser_clean_arch/2_application/screens/advice/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CubitCustomButton extends StatelessWidget {
  const CubitCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkResponse(
      onTap: () => BlocProvider.of<AdvicerCubit>(context).requestedGetAdvice(),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.colorScheme.secondary,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Get Advice',
                style: theme.textTheme.headlineMedium,
              )),
        ),
      ),
    );
  }
}
