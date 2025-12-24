import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS
// =======================

const Color _bgColor = Color(0xFFF8FAFC);
const Color _primaryColor = Color(0xFF22C55E);
const EdgeInsets _pagePadding = EdgeInsets.all(20);

// =======================
// 🖼️ IMÁGENES
// =======================

class ContactImages {
  static const String heroBackground = 'assets/images/contact/contact1.jpg';
  static const String whatsappImage = 'assets/images/contact/contact2.jpg';
  static const String phoneImage = 'assets/images/contact/contact3.jpg';
  static const String emailImage = 'assets/images/contact/contact4.jpg';
  static const String locationImage = 'assets/images/contact/contact5.jpg';
  static const String socialImage = 'assets/images/contact/contact2.jpg';
}

// =======================
// 🧠 CONTROLLER
// =======================

class ContactController {
  String get title => 'Conectemos';
  String get subtitle =>
      'Estamos listos para ayudarte de forma clara y profesional';

  String get address => 'Mariano Echeverría y San Francisco (Matriz)';
  String get mapsUrl => 'https://maps.app.goo.gl/j7WaFYy5XSoAvV6j7';

  List<Map<String, dynamic>> get actions => [
    {
      'title': 'WhatsApp General',
      'subtitle': 'Asesoría rápida y directa',
      'icon': Icons.chat,
      'url': 'https://wa.me/593980030415',
      'color': const Color(0xFF25D366),
      'image': ContactImages.whatsappImage,
    },
    {
      'title': 'Matriz',
      'subtitle': '09 8003 0415',
      'icon': Icons.phone,
      'url': 'tel:+593980030415',
      'color': const Color(0xFF3B82F6),
      'image': ContactImages.phoneImage,
    },
    {
      'title': 'Email',
      'subtitle': 'sac@qofin.com',
      'icon': Icons.email,
      'url': 'mailto:sac@qofin.com',
      'color': const Color(0xFFEF4444),
      'image': ContactImages.emailImage,
    },
  ];

  List<Map<String, dynamic>> get socials => [
    {
      'label': 'Instagram',
      'icon': Icons.camera_alt,
      'url': 'https://www.instagram.com/qofinec/',
      'color': const Color(0xFFE1306C),
    },
    {
      'label': 'Facebook',
      'icon': Icons.facebook,
      'url': 'https://www.facebook.com/QOFINEC',
      'color': const Color(0xFF1877F2),
    },
  ];
}

// =======================
// 🧱 UI
// =======================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }

  Widget _buildImage(String asset, {BoxFit fit = BoxFit.cover}) {
    return Image.asset(
      asset,
      fit: fit,
      errorBuilder:
          (_, __, ___) => Container(
            color: _primaryColor.withValues(alpha: 0.1),
            child: const Center(
              child: Icon(Icons.image, color: _primaryColor, size: 40),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ContactController();

    return Scaffold(
      backgroundColor: _bgColor,
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              // =======================
              // HEADER
              // =======================
              SizedBox(
                height: 280,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildImage(ContactImages.heroBackground),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(60, 0, 0, 0),
                            Color.fromARGB(160, 0, 0, 0),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.forum,
                            color: Colors.white,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            controller.title,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              controller.subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: _pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Formas de contacto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // =======================
                    // CONTACTO
                    // =======================
                    ...controller.actions.map((action) {
                      final color = action['color'] as Color;

                      return Container(
                        height: 140,
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(26, 0, 0, 0),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              _buildImage(action['image']),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      color.withValues(alpha: 0.7),
                                      color.withValues(alpha: 0.9),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => _open(action['url']),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(
                                        action['icon'],
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              action['title'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              action['subtitle'],
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 24),

                    // =======================
                    // UBICACIÓN
                    // =======================
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            _buildImage(ContactImages.locationImage),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withValues(alpha: 0.85),
                                    Colors.white.withValues(alpha: 0.95),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: _primaryColor,
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Text(
                                          'Nuestra ubicación',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1E293B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    controller.address,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF475569),
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: () => _open(controller.mapsUrl),
                                      icon: const Icon(Icons.map),
                                      label: const Text('Abrir en Google Maps'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _primaryColor,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        elevation: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // =======================
                    // REDES SOCIALES
                    // =======================
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            _buildImage(ContactImages.socialImage, fit: BoxFit.cover),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withValues(alpha: 0.88),
                                    Colors.white.withValues(alpha: 0.95),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Síguenos en redes',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: controller.socials.map((social) {
                                      final color = social['color'] as Color;
                                      return Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                color.withValues(alpha: 0.7),
                                                color.withValues(alpha: 0.9),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: InkWell(
                                            onTap: () => _open(social['url']),
                                            borderRadius: BorderRadius.circular(16),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 14,
                                              ),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    social['icon'],
                                                    color: Colors.white,
                                                    size: 28,
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    social['label'],
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}