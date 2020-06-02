import 'package:movilfinalapp/base/model.dart';
import 'package:movilfinalapp/models/user.dart';
import 'package:movilfinalapp/services/auth.dart';
import 'package:movilfinalapp/services/auth_provider.dart';
import '../locator.dart';

class SignUpViewModel extends BaseModel {
  final authService = locator<AuthService>();
  final authProvider = locator<AuthProvider>();

  User get user => authService.user;

  Future signUp(String name, String email, String password) async {
    setState(ViewState.Busy);

    try {
      await authService.signUp(name, email, password);
      authProvider.setSignedIn();
    } catch (error) {
      throw error;
    }

    notifyListeners();
    setState(ViewState.Idle);
  }

  setToIdle() {
    notifyListeners();
    setState(ViewState.Idle);
  }
}
