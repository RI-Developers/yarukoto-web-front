library todo_query;

import 'dart:async';

import 'todo.dart';
import 'package:angular/angular.dart';

@Injectable()
class TodoQuery {

  final Map<String, String> _todoUrl = {
    'load': 'todo/list',
    'update': 'todo/update'
  };

//  final String _todoRegistUrl = 'user/private/register_todo';
//  final String _todoUrl = 'todo.json';

  bool _result = false;

  Future _loaded;

  Map<String, Todo> _todoCache;

  final Http _http;

  TodoQuery(Http this._http) {
    _loaded = Future.wait([_loadTodo()]);
  }

  Future _loadTodo() {
    return _http.get(_todoUrl['load'])
    .then((HttpResponse response) {
      _result = response.data['result'];

      _todoCache = new Map<String, Todo>();

      if(_result) {

        List<Todo> todoList = response.data['todos'];
        for (Map todo in todoList) {
          Todo t = new Todo.fromJson(todo);
          _todoCache[t.id] = t;
        }

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

  Future<bool> sendTodo(Todo todo) {
    return _http.post(_todoUrl['update'], todo)
    .then((HttpResponse response) {
      return response.data['result'];
    })
    .catchError((error) {
      print(error);
      return false;
    });
  }
}
