library user_query;

import 'dart:async';

import 'user.dart';
import 'package:angular/angular.dart';

@Injectable()
class UserQuery {

  final String _todoRegistUrl = '/user/newuser';
  final String _loginUrl = '/user/login';
  final String _logoutUrl = '/user/logout';

  final Http _http;

  Future<bool> isLogin;

  UserQuery(Http this._http) {
    isLogin = loginCheck();
  }

  Future<bool> loginCheck() {
    return _http.get('user/logincheck')
    .then((HttpResponse response) => response.data['result'])
    .catchError((error) => false);
  }

  Future<Map> register(String username, String password) {
    return _http.post(_loginUrl, {'username': username, 'password': password})
      .then((HttpResponse response) => response.data);
  }

  Future<bool> login(String username, String password) {
    return _http.post(_loginUrl, {'username': username, 'password': password})
    .then((HttpResponse response) => response.data['result']);
  }

  Future<bool> logout() {
    return _http.get(_logoutUrl)
    .then((HttpResponse response) => response.data['result']);
  }

}
