library user_register_form;

import '../user_query.dart';
import 'package:angular/angular.dart';
import "dart:html";

@Component(
  selector: 'user-register',
  templateUrl: 'packages/Yarukoto/user/register/user_register_form_component.html',
  publishAs: 'cmp'
)
class UserRegisterFormComponent {

  get cmp => this;

  final Http _http;
  final UserQuery _userQuery;

  String username;
  String password;

  UserRegisterFormComponent(this._http, this._userQuery) {
    _userQuery.isLogin
    .then((bool result) {
      if(result) {
        window.location.href = '/';
      }
    });
  }

  void register() {
    _userQuery.register(username, password)
    .then((Map result) {
      String msg = result['result'] ? '成功!' : result['error'];
      window.alert(msg);
    });
  }


}
