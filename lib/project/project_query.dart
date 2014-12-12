library project_query;

import 'dart:async';

import 'project.dart';

import 'package:angular/angular.dart';

@Injectable()
class ProjectQuery {

  final Map<String, String> _projectURL = {
    'get':    '/project/list',
    'post':   '/project/update',
    'put':    '/project/update',
    'delete': '/project/delete',
  };

  final Http _http;

  ProjectQuery(Http this._http);

  Future<Map> get(String username) {
    return _http.post(_projectURL['get'], {'username': username})
    .then((HttpResponse response) => response.data);
  }

  Future<bool> post(String username, Project project) {
    return _http.post(_projectURL['post'], {'username': username, 'project': project})
    .then((HttpResponse response) => response.data['result']);
  }

  Future<bool> put(String username, Project project) {
    return _http.put(_projectURL['put'], {'username': username, 'project': project})
    .then((HttpResponse response) => response.data['result']);
  }

  Future<bool> delete(String username, Project project) {
    return _http.delete(_projectURL['delete'])
    .then((HttpResponse response) => response.data['result']);
  }

}
