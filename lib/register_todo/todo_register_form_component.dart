library regist_todo_list;

import '../service/todo.dart';
import '../service/query_service.dart';
import 'package:angular/angular.dart';
import "dart:html";

@Component(
  selector: 'register-todo',
  templateUrl: 'packages/Yarukoto/register_todo/todo_register_form_component.html',
  publishAs: 'cmp'
)
class TodoRegisterFormComponent {

  get cmp => this;

  final Http _http;
  final QueryService _queryService;

  Todo todo = new Todo.empty();

  TodoRegisterFormComponent(this._http, this._queryService);

  void addTodo() {
    _queryService.sendTodo(todo)
    .then((bool result) {
      String msg = result ? '成功!' : '失敗';
      window.alert(msg);
    });
  }


}
