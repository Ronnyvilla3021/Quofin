import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS MEJORADOS
// =======================

const Color _bgColor = Color(0xFFF8FAFC);
const Color _primaryColor = Color(0xFF22C55E);

const EdgeInsets _pagePadding = EdgeInsets.all(20);

// =======================
// 🖼️ IMÁGENES LOCALES - RUTAS FIJAS
// =======================
class AboutImages {
  // Imágenes de about
  static const String heroBackground = 'assets/images/about/about1.jpg';
  static const String missionImage = 'assets/images/about/about2.png';
  static const String visionImage = 'assets/images/about/about3.jpg';
  static const String experienceImage = 'assets/images/about/about5.jpg';

  // Imágenes adicionales para las otras secciones
  static const String manifestoImage = 'assets/images/about/about4.jpg';
  static const String valuesBgImage = 'assets/images/about/about3.jpg';
}

// =======================
// 🧠 LÓGICA / ESTADO
// =======================

class AboutController {
  String get heroTitle => 'Más que contadores,\nsomos aliados de tu crecimiento';

  String get manifesto =>
      'No creemos en la contabilidad fría ni complicada. Creemos en claridad, orden y tranquilidad. Acompañamos a personas y empresas a tomar decisiones financieras con confianza.';

  List<Map<String, dynamic>> get cards => [
        {
          'icon': Icons.track_changes,
          'title': 'Nuestra misión',
          'text': 'Convertir la contabilidad en una herramienta clara, útil y comprensible.',
          'color': const Color(0xFF3B82F6),
          'image': AboutImages.missionImage,
        },
        {
          'icon': Icons.visibility,
          'title': 'Nuestra visión',
          'text': 'Ser la firma contable que se recomienda por cercanía y resultados reales.',
          'color': const Color(0xFF8B5CF6),
          'image': AboutImages.visionImage,
        },
      ];

  List<Map<String, dynamic>> get values => [
        {'icon': Icons.verified_user, 'text': 'Responsabilidad'},
        {'icon': Icons.handshake, 'text': 'Compromiso'},
        {'icon': Icons.lightbulb_outline, 'text': 'Transparencia'},
        {'icon': Icons.groups, 'text': 'Trabajo en equipo'},
        {'icon': Icons.favorite_border, 'text': 'Confianza'},
      ];

  String get experienceYears => '16+';
  String get experienceText => 'Años acompañando negocios, emprendedores y profesionales';
}

// =======================
// 🧱 UI MEJORADO
// =======================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Método auxiliar para cargar imágenes con manejo de errores
  Widget _buildImage(String assetPath, {BoxFit fit = BoxFit.cover}) {
    return Image.asset(
      assetPath,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          debugPrint('Error loading image: $assetPath');
        });

        return Container(
          color: const Color(0xFF22C55E).withValues(alpha: 0.1),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  color: Color(0xFF22C55E),
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Imagen no encontrada',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF22C55E),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = AboutController();

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              // HEADER CON IMAGEN Y GRADIENTE
              SizedBox(
                height: 280,
                child: Stack(
                  children: [
                    // Imagen de fondo LOCAL
                    Positioned.fill(
                      child: _buildImage(AboutImages.heroBackground),
                    ),
                    // Gradiente overlay
                    Container(
                      height: 280,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.3),
                            Color.fromRGBO(0, 0, 0, 0.7),
                          ],
                        ),
                      ),
                    ),
                    // Contenido sobre la imagen
                    Positioned(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Sobre Nosotros',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.heroTitle,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.3,
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
                    const SizedBox(height: 24),

                    // MANIFIESTO - CON FONDO DE IMAGEN
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(AboutImages.manifestoImage),
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.2),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF22C55E).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.psychology,
                                color: Color(0xFF22C55E),
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                controller.manifesto,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // MISIÓN & VISIÓN
                    Column(
                      children: controller.cards.map((card) {
                        String image = card['image'] as String;
                        Color color = card['color'] as Color;
                        IconData icon = card['icon'] as IconData;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: 0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
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
                                          color.withValues(alpha: 0.7),
                                          color.withValues(alpha: 0.9),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // Contenido
                                Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.white.withValues(alpha: 0.3),
                                          ),
                                        ),
                                        child: Icon(
                                          icon,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              card['title'] as String,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              card['text'] as String,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(255, 255, 255, 0.95),
                                                height: 1.3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // VALORES - CON FONDO DE IMAGEN
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 240,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage(AboutImages.valuesBgImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.1),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF22C55E).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.stars,
                                    color: Color(0xFF22C55E),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Nuestros valores',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: controller.values.map((value) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.95),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFF22C55E).withValues(alpha: 0.3),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.05),
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        value['icon'] as IconData,
                                        color: const Color(0xFF22C55E),
                                        size: 15,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        value['text'] as String,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF0F172A),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // EXPERIENCIA - CON FONDO DE IMAGEN
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 180,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage(AboutImages.experienceImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.3),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(34, 197, 94, 0.8),
                              Color.fromRGBO(22, 163, 74, 0.9),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.workspace_premium,
                                color: Colors.white,
                                size: 36,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              controller.experienceYears,
                              style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                controller.experienceText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(255, 255, 255, 0.95),
                                  height: 1.3,
                                ),
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
      bottomNavigationBar: const BottomNav(),
    );
  }
}