import 'package:oruplus_demo_app/model/auth/auth_repository.dart';
import 'package:oruplus_demo_app/model/home/home_repository.dart';
import 'package:stacked/stacked.dart';

class OtpCreateViewModel extends BaseViewModel {
  final AuthRepository _authRepository;

  OtpCreateViewModel({
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
}
