import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS MEJORADOS
// =======================

const Color _bgColor = Color(0xFFF8FAFC);
const Color _cardColor = Colors.white;
const Color _primaryColor = Color(0xFF22C55E);
const Color _primaryDark = Color(0xFF16A34A);
const Color _textPrimary = Color(0xFF0F172A);
const Color _textMuted = Color(0xFF64748B);

const double _titleSize = 26;
const double _bodySize = 15;

const EdgeInsets _pagePadding = EdgeInsets.all(20);

// =======================
// 🖼️ IMÁGENES LOCALES - CONTACTO
// =======================
class ContactImages {
  static const String heroBackground = 'assets/images/contact/contact1.jpg';
  static const String whatsappImage = 'assets/images/contact/contact2.jpg';
  static const String phoneImage = 'assets/images/contact/contact3.jpg';
  static const String emailImage = 'assets/images/contact/contact4.jpg';
  static const String locationImage = 'assets/images/contact/contact5.jpg';
  static const String socialImage = 'assets/images/contact/contact6.jpg';
  static const String mapsImage = 'assets/images/contact/contact7.jpg';
}

// =======================
// 🧠 LÓGICA / CONTROLLER
// =======================

class ContactController {
  String get title => 'Conectemos';
  String get subtitle => 'Estamos listos para ayudarte de forma clara y profesional';

  List<Map<String, dynamic>> get actions => [
    {
      'title': 'WhatsApp General',
      'subtitle': 'Asesoría rápida y directa',
      'icon': Icons.chat,
      'url': 'https://wa.me/593980030415',
      'color': Color(0xFF25D366),
      'image': ContactImages.whatsappImage,
    },
    {
      'title': 'Matriz',
      'subtitle': '09 8003 0415',
      'icon': Icons.phone,
      'url': 'tel:+593980030415',
      'color': Color(0xFF3B82F6),
      'image': ContactImages.phoneImage,
    },
    {
      'title': 'Email',
      'subtitle': 'sac@qofin.com',
      'icon': Icons.email,
      'url': 'mailto:sac@qofin.com',
      'color': Color(0xFFEF4444),
      'image': ContactImages.emailImage,
    },
  ];

  // Dirección actualizada
  String get address =>
      'Mariano Echeverría y San Francisco\(Matriz)';

  // URL de Google Maps actualizada
  String get mapsUrl => 'https://maps.app.goo.gl/j7WaFYy5XSoAvV6j7';

  List<Map<String, dynamic>> get socials => [
    {
      'label': 'Instagram',
      'icon': Icons.camera_alt,
      'url': 'https://www.instagram.com/qofinec/',
      'color': Color(0xFFE1306C),
    },
    {
      'label': 'Facebook',
      'icon': Icons.facebook,
      'url': 'https://www.facebook.com/QOFINEC',
      'color': Color(0xFF1877F2),
    },
  ];
}

// =======================
// 🧱 UI MEJORADO
// =======================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _open(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }

  // Método auxiliar para cargar imágenes
  Widget _buildImage(String assetPath, {BoxFit fit = BoxFit.cover, double opacity = 0.0}) {
    return Image.asset(
      assetPath,
      fit: fit,
      color: opacity > 0 ? Colors.black.withOpacity(opacity) : null,
      colorBlendMode: opacity > 0 ? BlendMode.darken : null,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: _primaryColor.withOpacity(0.1),
          child: Center(
            child: Icon(
              Icons.image,
              color: _primaryColor,
              size: 40,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ContactController();

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              // HEADER CON IMAGEN DE FONDO
              Container(
                height: 280,
                child: Stack(
                  children: [
                    // Imagen de fondo
                    Positioned.fill(
                      child: _buildImage(
                        ContactImages.heroBackground,
                        opacity: 0.4,
                      ),
                    ),
                    // Gradiente overlay
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                    // Contenido sobre la imagen
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: const Icon(
                                Icons.forum,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              controller.title,
                              style: const TextStyle(
                                fontSize: _titleSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                controller.subtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: _bodySize,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    const SizedBox(height: 20),

                    const Text(
                      'Formas de contacto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _textPrimary,
                      ),
                    ),
                    
                    const SizedBox(height: 16),

                    // ACCIONES DE CONTACTO CON IMÁGENES
                    ...controller.actions.map((action) {
                      String image = action['image'] as String;
                      Color color = action['color'] as Color;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              // Imagen de fondo
                              Positioned.fill(
                                child: _buildImage(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              
                              // Overlay de color
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        color.withOpacity(0.7),
                                        color.withOpacity(0.9),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Contenido
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => _open(action['url']!),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(14),
                                            border: Border.all(
                                              color: Colors.white.withOpacity(0.3),
                                            ),
                                          ),
                                          child: Icon(
                                            action['icon'],
                                            color: Colors.white,
                                            size: 26,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                action['title']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                action['subtitle']!,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white.withOpacity(0.9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 24),

                    // DIRECCIÓN + MAPS CON FONDO DE IMAGEN
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(ContactImages.locationImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'Nuestra ubicación',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: _textPrimary,
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
                                color: _textMuted,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () => _open(controller.mapsUrl),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  elevation: 0,
                                ),
                                icon: const Icon(Icons.map, size: 20),
                                label: const Text(
                                  'Abrir en Google Maps',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // REDES SOCIALES CON FONDO DE IMAGEN
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(ContactImages.socialImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.15),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: _primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.share,
                                    color: _primaryColor,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Síguenos en redes',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: _textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: controller.socials.map((social) {
                                return Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          social['color'].withOpacity(0.9),
                                          social['color'].withOpacity(0.7),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: social['color'].withOpacity(0.3),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () => _open(social['url']!),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          child: Column(
                                            children: [
                                              Icon(
                                                social['icon'],
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                social['label']!,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
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
                    ),
                    
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}