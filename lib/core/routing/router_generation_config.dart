import 'package:go_router/go_router.dart';
import 'package:hungry/core/routing/app_routes.dart';
import '../../features/auth/view/loginPage.dart';
import '../../features/auth/view/signUpPage.dart';
import '../../features/splash/view/splashPage.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashPage,
    routes: [
      GoRoute(
        path: AppRoutes.splashPage,
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(path: AppRoutes.loginPage, builder: (_, _) => const LoginPage()),
      GoRoute(path: AppRoutes.signUpPage, builder: (_, _) => const SignUpPage()),
    ],
  );
}
