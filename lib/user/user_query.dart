library user_query;

import 'dart:async';

import 'package:angular/angular.dart';

@Injectable()
class UserQuery {

  final Map<String, String> _userURL = {
    'register': '/user/newuser',
    'login': '/user/login',
    'logout': '/user/logout'
  };

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
    return _http.post(_userURL['register'], {'username': username, 'password': password})
      .then((HttpResponse response) => response.data);
  }

  Future<bool> login(String username, String password) {
    return _http.post(_userURL['login'], {'username': username, 'password': password})
    .then((HttpResponse response) => response.data['result']);
  }

  Future<bool> logout() {
    return _http.get(_userURL['logout'])
    .then((HttpResponse response) => response.data['result']);
  }

}
