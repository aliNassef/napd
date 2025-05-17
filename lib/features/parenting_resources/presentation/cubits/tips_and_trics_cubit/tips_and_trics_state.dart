part of 'tips_and_trics_cubit.dart';

sealed class TipsAndTricsState extends Equatable {
  const TipsAndTricsState();

  @override
  List<Object> get props => [];
}

final class TipsAndTricsIntial extends TipsAndTricsState {
  const TipsAndTricsIntial();
}
final class TipsAndTricsLoading extends TipsAndTricsState {
  const TipsAndTricsLoading();
}
final class TipsAndTricsLoaded extends TipsAndTricsState {
  final List<TipsAndTricksModel> tipsAndTricks;
  const TipsAndTricsLoaded({required this.tipsAndTricks});

  @override
  List<Object> get props => [tipsAndTricks];
}
final class TipsAndTricsFailure extends TipsAndTricsState {
  final String errorMessage;
  const TipsAndTricsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
