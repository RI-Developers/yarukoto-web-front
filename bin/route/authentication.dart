library authentication;

import 'dart:io';

import 'package:redstone/server.dart' as app;
import 'package:mongo_dart/mongo_dart.dart';

import '../utils/authorization.dart';
import '../utils/utils.dart';

@app.Interceptor(r'/user/private/.+')
authenticationFilter() {
  if (app.request.session["username"] == null) {
    app.chain.interrupt(statusCode: HttpStatus.UNAUTHORIZED, responseValue: {"error": "NOT_AUTHENTICATED"});
  } else {
    app.chain.next();
  }
}

@app.Route("/user/login", methods: const[app.POST])
login(@app.Attr() Db conn, @app.Body(app.JSON) Map body) {
  var userCollection = conn.collection("user");
  if (body["username"] == null || body["password"] == null) {
    return {"result": false, "error": "WRONG_USER_OR_PASSWORD"};
  }
  var pass = encryptPassword(body["password"].trim());
  return userCollection.findOne({"username": body["username"], "password": pass})
  .then((user) {
    if (user == null) {
      return {
        "result": false,
        "error": "WRONG_USER_OR_PASSWORD"
      };
    }

    var session = app.request.session;
    session["username"] = user["username"];

    Set roles = new Set();
    bool admin = user["admin"];
    if (admin != null && admin) {
      roles.add(ADMIN);
    }
    session["roles"] = roles;

    return {"result": true};
  });
}

@app.Route("/user/logout")
logout() {
  app.request.session.destroy();
  return {"result": true};
}

@app.Route('/user/logincheck')
loginCheck() {
  bool result = app.request.session["username"] != null;

  return {"result": result};
}
