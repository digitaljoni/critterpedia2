import 'package:critterpedia/pages/pages.dart';

import 'package:fluro/fluro.dart';

class Routes {
  static Map<String, Handler> routeHandlers = <String, Handler>{
    MainPage.routeName: MainPage.routeHandler,
    FishPage.routeName: FishPage.routeHandler,
    SeaCreaturePage.routeName: SeaCreaturePage.routeHandler,
    InsectPage.routeName: InsectPage.routeHandler,
  };

  static void configureRoutes(Router router) {
    const transitionType = TransitionType.inFromRight;

    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return const NotFoundPage();
    });

    routeHandlers.forEach(
      (routePath, routeHandler) => router.define(
        routePath,
        handler: routeHandler,
        transitionType: transitionType,
      ),
    );
  }
}
