part of 'cry_translator_cubit.dart';

sealed class CryTranslatorState extends Equatable {
  const CryTranslatorState();

  @override
  List<Object> get props => [];
}

final class CryTranslatorInitial extends CryTranslatorState {}
final class CryTranslatorLoading extends CryTranslatorState {}
final class CryTranslatorSuccess extends CryTranslatorState {
  final CryModel cryModel;
  const CryTranslatorSuccess({required this.cryModel});

  @override
  List<Object> get props => [cryModel];
}
final class CryTranslatorError extends CryTranslatorState {
  final String errMessage;
  const CryTranslatorError({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
