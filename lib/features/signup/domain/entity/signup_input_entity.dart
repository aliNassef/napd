class SignupInputEntity {
  final String firstName, lastName, phoneNumber, password, email;
  final bool isRemembered;
  const SignupInputEntity({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.isRemembered,
  });
}
