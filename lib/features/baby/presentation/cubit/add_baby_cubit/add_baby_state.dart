part of 'add_baby_cubit.dart';

sealed class AddBabyState extends Equatable {
  const AddBabyState();

  @override
  List<Object> get props => [];
}

final class AddBabyInitial extends AddBabyState {}
final class AddBabyLoading extends AddBabyState {}
final class AddBabyLoaded extends AddBabyState {}
final class AddBabyFailure extends AddBabyState {
  final String errMessage;
  const AddBabyFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

