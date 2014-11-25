library user_login_form;

import '../user_query.dart';
import 'package:angular/angular.dart';
import "dart:html";

@Component(
  selector: '[login-user]',
  templateUrl: 'packages/Yarukoto/user/login/user_login_form_component.html',
  publishAs: 'cmp'
)
class UserLoginFormComponent {

  get cmp => this;

  final Http _http;
  final UserQuery _userQuery;

  String username;
  String password;

  UserLoginFormComponent(this._http, this._userQuery);

  void login() {
    _userQuery.login(username, password)
    .then((bool result) {
      if(result) {
        window.location.href = '/';
      } else {
        window.alert('失敗');
      }
    });
  }


}
