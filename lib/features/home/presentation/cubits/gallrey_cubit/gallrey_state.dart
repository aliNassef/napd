part of 'gallrey_cubit.dart';

sealed class GallreyState extends Equatable {
  const GallreyState();

  @override
  List<Object> get props => [];
}

final class GallreyInitial extends GallreyState {}

final class GallreyLoading extends GallreyState {}

final class GallreyLoaded extends GallreyState {
  final List<GallreyModel> gallrey;
  const GallreyLoaded({required this.gallrey});

  @override
  List<Object> get props => [gallrey];
}

final class GallreyFailure extends GallreyState {
  final String errMessage;
  const GallreyFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class AddImageToGallreyStateLoading extends GallreyState {}

final class AddImageToGallreyStateLoaded extends GallreyState {}

final class AddImageToGallreyStateFailure extends GallreyState {
  final String errMessage;
  const AddImageToGallreyStateFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class DeleteImageToGallreyStateLoading extends GallreyState {}

final class DeleteImageToGallreyStateLoaded extends GallreyState {}

final class DeleteImageToGallreyStateFailure extends GallreyState {
  final String errMessage;
  const DeleteImageToGallreyStateFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
