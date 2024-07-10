part of 'advicer_cubit.dart';

sealed class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerLoading extends AdvicerState {}

final class AdvicerLoaded extends AdvicerState {
  final String advice;
  const AdvicerLoaded({required this.advice});
  @override
  List<Object> get props => [advice];
}

final class AdvicerError extends AdvicerState {
  final String message;
  const AdvicerError({required this.message});
  @override
  List<Object> get props => [message];
}
