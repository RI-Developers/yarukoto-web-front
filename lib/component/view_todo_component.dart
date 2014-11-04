library view_task_component;

import '../service/todo.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'view-todo',
  templateUrl: 'packages/Yarukoto/component/view_todo_component.html',
  cssUrl: 'packages/Yarukoto/component/view_todo_component.css',
  publishAs: 'cmp',
  map : const{
    'content' : '=>todo_'
  })
class ViewTodoComponent {

  get cmp => this;

  Todo todo_;

  get todo {
    if(todo_.f_date == null) {
      todo_.f_date = '--';
    }
    return todo_;
  }

  ViewTodoComponent() {
  }
}
