import 'package:flutter/material.dart';
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
// 🖼️ IMÁGENES LOCALES - RUTAS FIJAS
// =======================
class AboutImages {
  // Imágenes de about
  static const String heroBackground = 'assets/images/about/about1.jpg';
  static const String missionImage = 'assets/images/about/about2.png';   
  static const String visionImage = 'assets/images/about/about3.jpg';    
  static const String valuesImage = 'assets/images/about/about4.jpg';    
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
      'color': Color(0xFF3B82F6),
      'image': AboutImages.missionImage,
    },
    {
      'icon': Icons.visibility,
      'title': 'Nuestra visión',
      'text': 'Ser la firma contable que se recomienda por cercanía y resultados reales.',
      'color': Color(0xFF8B5CF6),
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
        print('Error loading image: $assetPath');
        return Container(
          color: _primaryColor.withOpacity(0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  color: _primaryColor,
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Imagen no encontrada',
                  style: TextStyle(
                    fontSize: 12,
                    color: _primaryColor,
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
              Container(
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.7),
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
                  children: [
                    const SizedBox(height: 24),

                    // MANIFIESTO - CON FONDO DE IMAGEN
                    Container(
                      height: 180, // Reducido de 180
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(AboutImages.manifestoImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16), // Reducido de 20
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10), // Reducido de 12
                              decoration: BoxDecoration(
                                color: _primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.psychology,
                                color: _primaryColor,
                                size: 22, // Reducido de 24
                              ),
                            ),
                            const SizedBox(width: 14), // Reducido de 16
                            Expanded(
                              child: Text(
                                controller.manifesto,
                                style: const TextStyle(
                                  fontSize: 14, // Reducido de _bodySize (15)
                                  height: 1.5, // Reducido de 1.6
                                  color: _textMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Reducido de 24

                    // MISIÓN & VISIÓN
                    Column(
                      children: controller.cards.map((card) {
                        String image = card['image'] as String;
                        Color color = card['color'] as Color;
                        IconData icon = card['icon'] as IconData;
                        
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12), // Reducido de 16
                          height: 140, // Reducido de 150
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18), // Reducido de 20
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.2),
                                blurRadius: 10, // Reducido de 12
                                offset: const Offset(0, 3), // Reducido de 4
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18), // Reducido de 20
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
                                Padding(
                                  padding: const EdgeInsets.all(14), // Reducido de 16
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8), // Reducido de 10
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10), // Reducido de 12
                                          border: Border.all(
                                            color: Colors.white.withOpacity(0.3),
                                          ),
                                        ),
                                        child: Icon(
                                          icon,
                                          color: Colors.white,
                                          size: 20, // Reducido de 22
                                        ),
                                      ),
                                      const SizedBox(width: 10), // Reducido de 12
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              card['title'],
                                              style: const TextStyle(
                                                fontSize: 15, // Reducido de 16
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 4), // Reducido de 6
                                            Text(
                                              card['text'],
                                              style: TextStyle(
                                                fontSize: 12, // Reducido de 13
                                                color: Colors.white.withOpacity(0.95),
                                                height: 1.3, // Reducido de 1.4
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

                    const SizedBox(height: 20), // Reducido de 24

                    // VALORES - CON FONDO DE IMAGEN
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 240, // Reducido de 280
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18), // Reducido de 20
                        image: DecorationImage(
                          image: AssetImage(AboutImages.valuesBgImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.1),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16), // Reducido de 20
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(18), // Reducido de 20
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8), // Reducido de 10
                                  decoration: BoxDecoration(
                                    color: _primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10), // Reducido de 12
                                  ),
                                  child: const Icon(
                                    Icons.stars,
                                    color: _primaryColor,
                                    size: 20, // Reducido de 22
                                  ),
                                ),
                                const SizedBox(width: 10), // Reducido de 12
                                const Text(
                                  'Nuestros valores',
                                  style: TextStyle(
                                    fontSize: 17, // Reducido de 18
                                    fontWeight: FontWeight.bold,
                                    color: _textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16), // Reducido de 20
                            Wrap(
                              spacing: 8, // Reducido de 10
                              runSpacing: 8, // Reducido de 10
                              children: controller.values.map((value) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12, // Reducido de 14
                                    vertical: 8, // Reducido de 10
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.95),
                                    borderRadius: BorderRadius.circular(12), // Reducido de 14
                                    border: Border.all(
                                      color: _primaryColor.withOpacity(0.3),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 6, // Reducido de 8
                                        offset: const Offset(0, 3), // Reducido de 4
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        value['icon'],
                                        color: _primaryColor,
                                        size: 15, // Reducido de 16
                                      ),
                                      const SizedBox(width: 6), // Reducido de 8
                                      Text(
                                        value['text'],
                                        style: const TextStyle(
                                          fontSize: 12, // Reducido de 13
                                          color: _textPrimary,
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

                    const SizedBox(height: 20), // Reducido de 24

                    // EXPERIENCIA - CON FONDO DE IMAGEN
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 180, // Reducido de 220
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18), // Reducido de 20
                        image: DecorationImage(
                          image: AssetImage(AboutImages.experienceImage),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20), // Reducido de 24
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18), // Reducido de 20
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              _primaryColor.withOpacity(0.8),
                              _primaryDark.withOpacity(0.9),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12), // Reducido de 14
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16), // Reducido de 18
                              ),
                              child: const Icon(
                                Icons.workspace_premium,
                                color: Colors.white,
                                size: 36, // Reducido de 40
                              ),
                            ),
                            const SizedBox(height: 14), // Reducido de 16
                            Text(
                              controller.experienceYears,
                              style: const TextStyle(
                                fontSize: 38, // Reducido de 42
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6), // Reducido de 8
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8), // Añadido padding horizontal
                              child: Text(
                                controller.experienceText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14, // Reducido de 15
                                  color: Colors.white.withOpacity(0.95),
                                  height: 1.3, // Reducido de 1.4
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30), // Reducido de 40
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