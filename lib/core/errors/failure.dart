import 'package:equatable/equatable.dart';

import '../utils/app_strings.dart';

class Failure extends Equatable {
  final String errMessage;
  const Failure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(errMessage: AppStrings.noInternetConnection);
}
