library todo_service;

import 'package:redstone/server.dart' as app;
import 'package:mongo_dart/mongo_dart.dart';

import '../utils/authorization.dart';

//A private service. Only authenticated users with the 'ADMIN' role
//can view the list of registered users
@app.Route("/user/private/register_todo", methods: const[app.POST])
registerTodo(@app.Attr() Db conn, @app.Body(app.JSON) Map body) {

  var todoCollection = conn.collection("todo");

  print(body);

  if (app.request.session["username"] == null || body["title"] == null) {
    return {"result": false, "error": "項目不足"};
  }

  var todo = {
    "author_name": app.request.session["username"],
    "title": body["title"],
    "finished": body["finished"],
    "c_date": body["c_date"],
    "s_s_date": body["s_s_date"],
    "s_f_date": body["s_f_date"],
    "f_date": body["f_date"]
  };

  return todoCollection.insert(todo).then((resp) => {"result": true});

}
