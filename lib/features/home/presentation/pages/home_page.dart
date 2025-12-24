import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- Agrega esta importación
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS MEJORADOS
// =======================

const Color _primaryColor = Color(0xFF22C55E);
const Color _primaryDark = Color(0xFF16A34A);
const Color _backgroundColor = Color(0xFFF8FAFC);
const Color _cardColor = Colors.white;
const Color _textPrimary = Color(0xFF0F172A);
const Color _textMuted = Color(0xFF64748B);
const Color _accentColor = Color(0xFF10B981);

const double _titleSize = 28;
const double _subtitleSize = 16;
const double _bodySize = 15;

const EdgeInsets _pagePadding = EdgeInsets.all(20);

// =======================
// 🖼️ IMÁGENES LOCALES
// =======================
class AppImages {
  // Logo
  static const String logo = 'assets/images/home/logo.jpg';
  
  // Hero: Imagen de fondo profesional
  static const String heroBackground = 'assets/images/home/home1.jpeg';
  
  // Servicios
  static const String advisoryImage = 'assets/images/home/home2.jpeg';
  static const String taxImage = 'assets/images/home/home3.jpeg';
  static const String custodyImage = 'assets/images/home/home4.jpeg';
  
  // Estadísticas
  static const String statsPattern = 'assets/images/home/home5.jpeg';
  
  // Cita
  static const String quoteAuthorImage = 'assets/images/home/home6.jpeg';
}

// =======================
// 🧠 LÓGICA / ESTADO
// =======================

class HomeController {
  String get title => 'QOFIN';
  
  String get heroTitle => 'Expertos en\nAsesoría Financiera';
  
  String get heroSubtitle => 
      'Más de 16 años impulsando el crecimiento de negocios y personas';

  List<Map<String, dynamic>> get services => [
    {
      'title': 'Asesoría Financiera',
      'description': 'Estrategias personalizadas para tu negocio',
      'icon': Icons.trending_up,
      'gradient': [Color(0xFF22C55E), Color(0xFF16A34A)],
      'image': AppImages.advisoryImage,
    },
    {
      'title': 'Gestión Tributaria',
      'description': 'Elaboración y pago de impuestos',
      'icon': Icons.receipt_long,
      'gradient': [Color(0xFF3B82F6), Color(0xFF2563EB)],
      'image': AppImages.taxImage,
    },
    {
      'title': 'Custodia Documental',
      'description': 'Manejo seguro de tu papelería',
      'icon': Icons.folder_special,
      'gradient': [Color(0xFFA855F7), Color(0xFF9333EA)],
      'image': AppImages.custodyImage,
    },
  ];

  String get quote =>
      '"Un activo pone dinero en mi bolsillo, un pasivo lo saca de él"';
  
  String get quoteAuthor => 'Robert Kiyosaki';

  List<Map<String, String>> get stats => [
    {'value': '16+', 'label': 'Años de\nexperiencia', 'icon': '⭐'},
    {'value': '180+', 'label': 'Clientes\nnaturales', 'icon': '👥'},
    {'value': '20+', 'label': 'PYMES\natendidas', 'icon': '🏢'},
    {'value': '\$200K+', 'label': 'Recursos\nrecuperados', 'icon': '💰'},
  ];
  
  // Método para abrir la página web
  Future<void> launchWebsite() async {
    final Uri url = Uri.parse('https://qofin.com');
    
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // Abre en navegador externo
    )) {
      throw Exception('No se pudo abrir $url');
    }
  }
}

// =======================
// 🧱 UI MEJORADO CON IMÁGENES
// =======================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Método auxiliar para crear tarjetas de estadísticas
  Widget _buildStatCard(String value, String label, String icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: _textMuted,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para cargar imágenes con placeholder
  Widget _buildImage(String assetPath, {BoxFit fit = BoxFit.cover, double opacity = 0.4}) {
    return Image.asset(
      assetPath,
      fit: fit,
      color: Colors.black.withOpacity(opacity),
      colorBlendMode: BlendMode.darken,
      // Añade un placeholder o manejo de error
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. HERO SECTION CON IMAGEN DE FONDO
              Container(
                height: 500,
                child: Stack(
                  children: [
                    // Fondo con imagen LOCAL
                    Positioned.fill(
                      child: _buildImage(
                        AppImages.heroBackground,
                        opacity: 0.4,
                      ),
                    ),
                    
                    // Contenido
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(1, 1),
                                    )
                                  ],
                                ),
                              ),
                              // LOGO en lugar del icono de notificaciones
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppImages.logo,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(
                                          Icons.business,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const Spacer(),
                          
                          // Card del hero
                          Container(
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.92),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  controller.heroTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: _titleSize,
                                    fontWeight: FontWeight.bold,
                                    color: _textPrimary,
                                    height: 1.3,
                                  ),
                                ),
                                
                                const SizedBox(height: 12),
                                
                                Text(
                                  controller.heroSubtitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: _bodySize,
                                    color: _textMuted,
                                    height: 1.5,
                                  ),
                                ),
                                
                                const SizedBox(height: 24),
                                
                                // BOTÓN MODIFICADO
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _primaryColor,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () async {
                                    try {
                                      await controller.launchWebsite();
                                    } catch (e) {
                                      // Manejo de error opcional
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Error al abrir la página web: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Visita nuestra web',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward, size: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ... (el resto del código permanece igual)
              // 2. SERVICIOS CON IMÁGENES
              Padding(
                padding: _pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '¿Qué hacemos?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Servicios diseñados para tu éxito',
                      style: TextStyle(
                        fontSize: _bodySize,
                        color: _textMuted,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    ...controller.services.map((service) {
                      List<Color> gradient = service['gradient'] as List<Color>;
                      String image = service['image'] as String;
                      IconData icon = service['icon'] as IconData;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: gradient[0].withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              // Imagen de fondo LOCAL
                              Positioned.fill(
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                  color: gradient[0].withOpacity(0.7),
                                  colorBlendMode: BlendMode.color,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: gradient[0],
                                    );
                                  },
                                ),
                              ),
                              
                              // Gradiente
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        gradient[0].withOpacity(0.8),
                                        gradient[1].withOpacity(0.9),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Contenido
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Icon(
                                            icon,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                service['title'] as String,
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                service['description'] as String,
                                                style: TextStyle(
                                                  fontSize: 14,
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
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 3. QUOTE CON IMAGEN DEL AUTOR
              Padding(
                padding: _pagePadding,
                child: Container(
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _primaryColor.withOpacity(0.2),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagen del autor LOCAL
                      Container(
                        width: 120,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            bottomLeft: Radius.circular(22),
                          ),
                          child: Image.asset(
                            AppImages.quoteAuthorImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: _primaryColor.withOpacity(0.1),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    color: _primaryColor,
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      
                      // Contenido
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.format_quote,
                                color: _primaryColor,
                                size: 40,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                controller.quote,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: _textPrimary,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '— ${controller.quoteAuthor}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: _primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // 4. ESTADÍSTICAS CON FONDO DECORATIVO
              Padding(
                padding: _pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nuestro impacto',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: AssetImage(AppImages.statsPattern), // LOCAL
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Opacity(
                        opacity: 0.9,
                        child: Column(
                          children: [
                            // PRIMERA FILA (2 elementos)
                            Row(
                              children: [
                                Expanded(
                                  child: _buildStatCard(
                                    controller.stats[0]['value']!,
                                    controller.stats[0]['label']!,
                                    controller.stats[0]['icon']!,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildStatCard(
                                    controller.stats[1]['value']!,
                                    controller.stats[1]['label']!,
                                    controller.stats[1]['icon']!,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            // SEGUNDA FILA (2 elementos)
                            Row(
                              children: [
                                Expanded(
                                  child: _buildStatCard(
                                    controller.stats[2]['value']!,
                                    controller.stats[2]['label']!,
                                    controller.stats[2]['icon']!,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildStatCard(
                                    controller.stats[3]['value']!,
                                    controller.stats[3]['label']!,
                                    controller.stats[3]['icon']!,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // Espacio para el bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}