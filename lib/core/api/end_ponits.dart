abstract class EndPoints {
  static const String baseUrl =
      'http://graduation-project-version1.runasp.net/';
  static const String register = 'Auth/register';
  static const String login = 'Auth/Login';
  static const String getMotherData = 'Account/GetMotherProfile';
  static const String updateMotherProfile = 'Account/UpdateMotherprofile';
  static const String changePassword = 'Account/Change-Password';
  static const String forgetPassword = 'Auth/Forget-Password';
  static const String resetPassword = 'Reset-Password';
  static const String addBaby = 'Account/AddBaby';
  static const String chooseBaby = 'Account/ChooseBaby?BabyId=';
  static const String updateBabyProfile = 'Account/updateBabyProfile';
  static const String confirmPassword = 'Auth/confirm-email';
  static const String resendConfirmEmail = 'Auth/resend-confirm-email';
  static const String getAllGovernorates = 'Hospital/GetAllGovernorates';
  static const String getAllHospital = 'Hospital/GetAllHospitals';
  static const String filterHospitalById = 'Hospital/GetAllFilteredHospitals/';
  static const String getHospitalById = 'Hospital/GetById/';
  static const String addHospitlaToFav = 'Hospital/AddToFav/';
  static const String getFavoriteHospital = 'Hospital/GetFavouriteHospitals';
}

abstract class ApiKey {
  static const email = 'email';
  static const password = 'password';
  static const confirmPassword = 'confirmPassword';
  static const token = 'token';
  static const userData = 'userData';
  static const babyId = 'babyId';
}
