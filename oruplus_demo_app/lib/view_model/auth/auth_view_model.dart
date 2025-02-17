import 'package:oruplus_demo_app/model/auth/auth_repository.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  final AuthRepository _authRepository;

  AuthViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> createOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    setBusy(true);
    await _authRepository.createOtp(
      countryCode: countryCode,
      mobileNumber: mobileNumber,
    );
    setBusy(false);
  }

  Future<void> validateOTP({
    required int countryCode,
    required int phoneNumber,
    required int otp,
  }) async {
    setBusy(true);
    await _authRepository.validateOtp(
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      otp: otp,
    );
    setBusy(false);
  }
}
