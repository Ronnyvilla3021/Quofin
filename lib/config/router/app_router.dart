import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/home/presentation/pages/home_page.dart';
import 'package:flutter_application_1/features/home/presentation/pages/about_page.dart';
import 'package:flutter_application_1/features/home/presentation/pages/services_page.dart';
import 'package:flutter_application_1/features/home/presentation/pages/contact_page.dart';


class AppRouter {
  static const home = '/';
  static const about = '/about';
  static const services = '/services';
  static const contact = '/contact';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case services:
        return MaterialPageRoute(builder: (_) => const ServicesPage());
      case contact:
        return MaterialPageRoute(builder: (_) => const ContactPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
