// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library yarukoto;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'package:Yarukoto/todo/todo_query.dart';
import 'package:Yarukoto/todo/list/component/list/todo_list_component.dart';
import 'package:Yarukoto/todo/list/todo_list.dart';

import 'package:Yarukoto/todo/list/component/register/todo_register_form_component.dart';

import 'package:Yarukoto/user/login/user_login_form_component.dart';
import 'package:Yarukoto/user/user_query.dart';


import 'package:Yarukoto/route/todo_route.dart';

class YarukotoAppModule extends Module {
  YarukotoAppModule() {
    bind(TodoQuery);
    bind(ViewTodoComponent);
    bind(TodoListComponent);
    bind(TodoRegisterFormComponent);
    bind(UserQuery);
    bind(UserLoginFormComponent);

    bind(RouteInitializerFn, toValue: todoRouteRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
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

