library query_service_unittest;

import 'dart:html';
import 'dart:convert';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import 'package:Yarukoto/service/todo.dart';

main() {
  useHtmlConfiguration();


  test('test', () {

    Todo todo = new Todo.fromJson(
      JSON.decode('{"_id": "gromg498tqdw22fexfj", "author_name": "Magnum", "title": "TODOテスト", "c_date": "2014/12/1/10:25", "s_s_date": "2014/12/1/10:25", "s_f_date": "2014/12/31/10:25", "finished": false}')
    );
    expect(todo.id, equals('gromg498tqdw22fexfj'));
    expect(todo.author_name, equals('Magnum'));
    expect(todo.title, equals('TODOテスト'));
    expect(todo.c_date, equals('2014/12/1/10:25'));
    expect(todo.s_s_date, equals('2014/12/1/10:25'));
    expect(todo.s_f_date, equals('2014/12/31/10:25'));
    expect(todo.finished, equals(false));
  });
}
