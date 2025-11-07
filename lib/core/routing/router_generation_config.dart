import 'package:go_router/go_router.dart';
import 'package:hungry/core/routing/app_routes.dart';

import '../../features/splash/view/splashPage.dart';

class RouterGenerationConfig{
  static GoRouter goRouter = GoRouter(
      initialLocation: AppRoutes.splashPage,
      routes: [
        GoRoute(
          path: AppRoutes.splashPage,
          builder: (context, state) => const SplashPage(),
        ),

      ]);
}