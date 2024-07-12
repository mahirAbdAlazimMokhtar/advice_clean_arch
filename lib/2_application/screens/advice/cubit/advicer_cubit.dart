import 'package:adviser_clean_arch/1_domain/failures/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../1_domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Unexpected Error, please try again';
const cachedFailureMessage = 'uups , Cache Error, please try again';
const serverFailureMessage = 'Server Error, please try again';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit({required this.adviceUsecases}) : super(AdvicerInitial());
  final AdviceUsecases adviceUsecases ;
  void requestedGetAdvice() async {
    emit(AdvicerLoading());

    final failureOrGetAdvice = await adviceUsecases.getAdvice();
    failureOrGetAdvice.fold(
      (failure) => emit(AdvicerError(message: _mapFailureToMessage(failure))),
      (advice) => emit(AdvicerLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return serverFailureMessage;
      case const (CacheFailure):
        return cachedFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
