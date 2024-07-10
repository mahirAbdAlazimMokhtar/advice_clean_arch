part of 'advice_bloc.dart';

abstract class AdviceState extends Equatable {
  const AdviceState();  

  @override
  List<Object> get props => [];
}
class AdviceInitial extends AdviceState {}
class AdviceStateLoading extends AdviceState {}
class AdviceStateLoaded extends AdviceState {
  final String advice;
  const AdviceStateLoaded({required this.advice});
    @override
  List<Object> get props => [advice];
}
class AdviceStateError extends AdviceState {
  final String message;
  const AdviceStateError({required this.message});
    @override
  List<Object> get props => [message];
}