library todo_service;

import 'package:redstone/server.dart' as app;
import 'package:mongo_dart/mongo_dart.dart';

import '../utils/authorization.dart';


@app.Route('/todo/update', methods: const[app.POST])
registerTodo(@app.Attr() Db conn, @app.Body(app.JSON) Map body) {

  var todoCollection = conn.collection("todo");

  if (app.request.session['username'] == null || body['title'] == null) {
    return {"result": false, "error": "項目不足"};
  }

  var todo = {
    'author_name': app.request.session['username'],
    'title': body['title'],
    'finished': body['finished'],
    'c_date': body['c_date'],
    's_s_date': body['s_s_date'],
    's_f_date': body['s_f_date'],
    'f_date': body['f_date']
  };

  if(body.containsKey('_id')) {
    todo['_id'] = body['_id'];
  }

  return todoCollection.insert(todo).then((resp) => {"result": true});

}

@app.Route('/todo/list', methods: const[app.POST])
getTodo(@app.Attr() Db conn, @app.Body(app.JSON) Map body) {
  var todoCollection = conn.collection("todo");

  if (app.request.session['username'] == null) {
    return {"result": false, "error": "DON'T LOGIN."};
  }

  return todoCollection.find().toList();
}

