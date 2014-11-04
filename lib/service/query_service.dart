library query_service;

import 'dart:async';

import 'todo.dart';
import 'package:angular/angular.dart';

@Injectable()
class QueryService {
  String _todoUrl = 'todo.json';

  Future _loaded;

  Map<String, Todo> _todoCache;

  final Http _http;

  QueryService(Http this._http) {
    _loaded = Future.wait([_loadTodo()]);
  }

  Future _loadTodo() {
    return _http.get(_todoUrl)
    .then((HttpResponse response) {
      _todoCache = new Map<String, Todo>();
      for (Map todo in response.data) {
        Todo r = new Todo.fromJson(todo);
//        print(r);
        _todoCache[r.id] = r;
      }
    });
  }

  Future<Todo> getTodoById(String id) {
    return _todoCache == null
    ? _loaded.then((_) => _todoCache[id])
    : new Future.value(_todoCache[id]);
  }

  Future<Map<String, Todo>> getAllTodo() {
    return _todoCache == null
    ? _loaded.then((_) => _todoCache)
    : new Future.value(_todoCache);
  }
}
