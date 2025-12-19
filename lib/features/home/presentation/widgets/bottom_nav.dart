import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.95),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            label: 'Inicio',
            route: '/',
            currentRoute: currentRoute,
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          _NavItem(
            icon: Icons.work_outline,
            label: 'Servicios',
            route: '/services',
            currentRoute: currentRoute,
            onTap: () => Navigator.pushReplacementNamed(context, '/services'),
          ),
          _NavItem(
            icon: Icons.groups_outlined,
            label: 'Nosotros',
            route: '/about',
            currentRoute: currentRoute,
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          _NavItem(
            icon: Icons.call_outlined,
            label: 'Contacto',
            route: '/contact',
            currentRoute: currentRoute,
            onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String? currentRoute;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final active = currentRoute == route;
    final color = active ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.green.withOpacity(.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
