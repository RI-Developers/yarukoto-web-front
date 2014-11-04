library todo_list_component;

import 'package:angular/angular.dart';
import 'component/view_todo_component.dart';
import 'service/todo.dart';
import 'service/query_service.dart';

@Component(
  selector: 'todo-list',
  templateUrl: 'packages/Yarukoto/todo_list.html',
  cssUrl: 'packages/Yarukoto/todo_list.css',
  publishAs: 'cmp'
)
class TodoListComponent {

  get cmp => this;

  static const String LOADING_MESSAGE = "Now Loading";
  static const String ERROR_MESSAGE ="Error!";

  final Http _http;
  final QueryService queryService;

  String message = LOADING_MESSAGE;
  bool todoLoaded = false;

  Map<String, Todo> _todoMap = {
  };

  Map<String, Todo> get todoMap => _todoMap;

  List<Todo> _allTodo = [];
  List<Todo> get allTodo => _allTodo;

  TodoListComponent(this._http, this.queryService) {
    _loadData();
  }

  void _loadData() {
    queryService.getAllTodo()
    .then((Map<String, Todo> allTodo) {
      _todoMap = allTodo;
      _allTodo = _todoMap.values.toList();
      todoLoaded = true;
    })
    .catchError((e) {
      print(e);
      todoLoaded = false;
      message = ERROR_MESSAGE;
    });
  }
}
