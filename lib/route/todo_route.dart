library todo_route;

import 'package:angular/angular.dart';

void todoRouteRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'login': ngRoute(
      path: '/login',
      view: 'view/login.html'),
    'todo': ngRoute(
      path: '/',
      view: 'view/todo.html',
      defaultRoute: true)
  });
}
