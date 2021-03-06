// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library yarukoto;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:logging/logging.dart';

import 'package:Yarukoto/service/query_service.dart';
import 'package:Yarukoto/component/view_todo_component.dart';
import 'package:Yarukoto/todo_list.dart';

class YarukotoAppModule extends Module {
  YarukotoAppModule() {
    bind(QueryService);
    bind(ViewTodoComponent);
    bind(TodoListComponent);
//    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  Logger.root
    ..level = Level.FINEST
    ..onRecord.listen((LogRecord r) {
    print(r.message);
  });
  applicationFactory()
  .addModule(new YarukotoAppModule())
  .run();
}
