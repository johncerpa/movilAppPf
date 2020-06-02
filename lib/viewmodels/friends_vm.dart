import 'package:movilfinalapp/base/model.dart';
import 'package:movilfinalapp/services/auth.dart';
import 'package:movilfinalapp/services/auth_provider.dart';
import 'package:movilfinalapp/services/lists_service.dart';
import '../locator.dart';

class FriendsViewModel extends BaseModel {
  final authService = locator<AuthService>();
  final authProvider = locator<AuthProvider>();
  final listsService = locator<ListsService>();

  dynamic get lists => listsService.lists;
  dynamic get friendList => listsService.friendList;

  setFriendList(dynamic list) {
    listsService.friendList = list;
  }

  Future getLists() async {
    setState(ViewState.Busy);
    try {
      await listsService.getLists();
      notifyListeners();
    } catch (error) {
      throw error;
    }
    setState(ViewState.Idle);
  }

  Future logout() async {
    setState(ViewState.Busy);
    await authService.signOut();
    authProvider.logout();
    setState(ViewState.Idle);
  }
}
