import 'package:easy_localization/easy_localization.dart';

class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(errMessage: 'nointernetconnection'.tr());
}
