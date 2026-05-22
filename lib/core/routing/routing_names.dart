class RoutingNames {
  // تمنع إنشاء نسخة من الكلاس لأنه يحتوي على متغيرات ثابتة فقط
  const RoutingNames._();

  // المسار الابتدائي للمشروع (شاشة البداية أو تسجيل الدخول كمثال)
  static const String initial = '/';

  // أمثلة لمسارات عامة يمكنك تغييرها أو إضافة مسارات الـ features الجديدة هنا
  static const String login = '/login';
  static const String home = '/home';
  static const String editNote = '/editNote';
  static const String settings = '/settings';
}
