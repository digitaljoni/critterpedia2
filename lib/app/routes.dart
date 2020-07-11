import 'package:critterpedia/pages/pages.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static var routeHandlers = <String, Handler>{
    MainPage.routeName: MainPage.routeHandler,
    ProfilePage.routeName: ProfilePage.routeHandler,
    LoginPage.routeName: LoginPage.routeHandler,
    SettingsPage.routeName: SettingsPage.routeHandler,
    HomePage.routeName: HomePage.routeHandler,
  };

  static void configureRoutes(Router router) {
    const transitionType = TransitionType.inFromRight;

    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return NotFoundPage();
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
