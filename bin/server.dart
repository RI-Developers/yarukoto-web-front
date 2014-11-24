import 'package:redstone/server.dart' as app;
import 'package:di/di.dart';
import 'package:shelf_static/shelf_static.dart';

import 'utils/database.dart';
import 'route/authentication.dart';

import 'utils/authorization.dart';
import 'route/services.dart';
import 'route/todo_service.dart';

main() {

  app.setupConsoleLog();
  app.setShelfHandler(createStaticHandler("web",
  defaultDocument: "index.html",
  serveFilesOutsidePath: true));

  var dbUri = "mongodb://localhost:27017/auth_example";
  var poolSize = 3;

  app.addModule(new Module()
    ..bind(MongoDbPool, toValue: new MongoDbPool(dbUri, poolSize)));

  app.addPlugin(AuthorizationPlugin);

  app.setupConsoleLog();

  app.start();

}
