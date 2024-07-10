
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit() : super(AdvicerInitial());
  void requestedGetAdvice() async {
    emit(AdvicerLoading());
    debugPrint('Fake get Advice triggered');
      await Future.delayed(const Duration(seconds: 5));
      debugPrint('Get Advice');
      emit(const AdvicerLoaded(advice: 'Fake Advice to test Bloc'));
     // emit(const AdvicerError(message: 'Error Message Test'));
  }
}
