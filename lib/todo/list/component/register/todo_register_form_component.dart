library regist_todo_list;

import '../../../todo.dart';
import '../../../todo_query.dart';
import 'package:angular/angular.dart';
import "dart:html";

@Component(
  selector: 'register-todo',
  templateUrl: 'packages/Yarukoto/todo/list/component/register/todo_register_form_component.html',
  publishAs: 'cmp'
)
class TodoRegisterFormComponent {

  get cmp => this;

  final Http _http;
  final TodoQuery _todoQuery;

  Todo todo = new Todo.empty();

  TodoRegisterFormComponent(this._http, this._todoQuery);

  void addTodo() {
    _todoQuery.sendTodo(todo)
    .then((bool result) {
      String msg = result ? '成功!' : '失敗';
      window.alert(msg);
    });
  }


}
