// app_navigation.dart
class AppNavigation {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String foodDetail = '/foodDetail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String orderConfirmation = '/orderConfirmation';
  static const String chatbot = '/chatbot';
  static const String menu = '/menu';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String orders = '/orders';
  static const String adminPanel = '/adminPanel';
  static const String map = '/map';
  static const String locationAlert = '/locationAlert';
  static const String favorites = '/favorites';
  static const String deals = '/deals';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case foodDetail:
        return MaterialPageRoute(builder: (_) => const FoodDetailScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case orderConfirmation:
        return MaterialPageRoute(
          builder: (_) => const OrderConfirmationScreen(),
        );
      case chatbot:
        return MaterialPageRoute(builder: (_) => const ChatbotScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case orders:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case adminPanel:
        return MaterialPageRoute(builder: (_) => const AdminPanelScreen());
      case map:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case locationAlert:
        return MaterialPageRoute(builder: (_) => const LocationAlertScreen());
      case favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case deals:
        return MaterialPageRoute(builder: (_) => const DealsScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
