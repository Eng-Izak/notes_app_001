import 'package:flutter/material.dart';
import 'package:notes_app_001/features/edite_note/ui/edite_note_view.dart';
import 'package:notes_app_001/features/home/ui/home_view.dart';
import 'routing_names.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // لاستقبال أي بيانات ممررة بين الشاشات (الأرجومنت)
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case RoutingNames.initial:
        return _buildPageRoute(child: const HomeView());

      case RoutingNames.editNote:
        return _buildPageRoute(child: const EditNoteView());

      case RoutingNames.home:
        return _buildPageRoute(
          child: const Scaffold(body: Center(child: Text('Home Screen'))),
        );

      // في حال تم طلب مسار غير مسجل، يتم توجيهه لشاشة خطأ ذكية بدلاً من توقف التطبيق
      default:
        return _buildPageRoute(
          child: UndefinedRouteScreen(routeName: settings.name ?? 'Unknown'),
        );
    }
  }

  // دالة عامة لإنشاء حركة انتقال احترافية (Fade & Slide) بين الشاشات
  static PageRouteBuilder _buildPageRoute({required Widget child}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(
                  0.05,
                  0.0,
                ), // إزاحة خفيفة جهة اليمين عند الدخول
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeOut)),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

// كلاس داخلي يظهر عند طلب شاشة غير موجودة (مفيد جداً أثناء التطوير)
class UndefinedRouteScreen extends StatelessWidget {
  final String routeName;
  const UndefinedRouteScreen({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Error')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Error: The route "$routeName" is not defined in AppRouter.',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
