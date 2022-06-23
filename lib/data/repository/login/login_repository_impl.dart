import 'package:imagineapps_leal/domain/domain.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  bool loginUser({required String? name, required String? password}) {
    if (name == 'maria' && password == 'password') {
      return true;
    }

    if (name == 'pedro' && password == '123456') {
      return true;
    }

    return false;
  }
}
