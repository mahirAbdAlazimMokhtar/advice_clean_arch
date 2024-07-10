import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      debugPrint('Fake get Advice triggered');
      await Future.delayed(const Duration(seconds: 2));
      debugPrint('Get Advice');
      emit(const AdviceStateLoaded(advice: 'Fake Advice to test Bloc'));
    });
  }
}
