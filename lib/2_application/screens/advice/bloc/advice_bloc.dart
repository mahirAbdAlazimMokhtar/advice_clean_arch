import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../1_domain/failures/failures.dart';
import '../../../../1_domain/usecases/advice_usecases.dart';

part 'advice_event.dart';
part 'advice_state.dart';

const serverFailureMessage = 'Server Error, please try again';
const cachedFailureMessage = 'uups , Cache Error, please try again';
const generalFailureMessage = 'Unexpected Error, please try again';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  final AdviceUsecases adviceUsecases ;
  AdviceBloc(this.adviceUsecases) : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      final failureOrGetAdviceData = await adviceUsecases.getAdvice();
      failureOrGetAdviceData.fold(
          (failure) =>
              emit(AdviceStateError(message: _mapFailureToMessage(failure))),
          (advice) => emit(AdviceStateLoaded(advice: advice.advice)));
    });
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
