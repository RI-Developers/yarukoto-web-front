// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library yarukoto_register;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'package:Yarukoto/user/user_query.dart';
import 'package:Yarukoto/user/register/user_register_form_component.dart';

class RegisterAppModule extends Module {
  RegisterAppModule() {
    bind(UserQuery);
    bind(UserRegisterFormComponent);
  }
}

void main() {
  applicationFactory()
  .addModule(new RegisterAppModule())
  .run();
}

