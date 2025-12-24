import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS MEJORADOS
// =======================

const Color _primaryColor = Color(0xFF22C55E);
const Color _backgroundColor = Color(0xFFF8FAFC);
const Color _cardColor = Colors.white;

const EdgeInsets _pagePadding = EdgeInsets.all(20);

// =======================
// 🖼️ IMÁGENES LOCALES
// =======================
class AppImages {
  static const String logo = 'assets/images/home/logo.jpg';
  static const String heroBackground = 'assets/images/home/home1.jpeg';
  static const String advisoryImage = 'assets/images/home/home2.jpeg';
  static const String taxImage = 'assets/images/home/home3.jpeg';
  static const String custodyImage = 'assets/images/home/home4.jpeg';
  static const String statsPattern = 'assets/images/home/home5.jpeg';
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
      'gradient': [const Color(0xFF22C55E), const Color(0xFF16A34A)],
      'image': AppImages.advisoryImage,
    },
    {
      'title': 'Gestión Tributaria',
      'description': 'Elaboración y pago de impuestos',
      'icon': Icons.receipt_long,
      'gradient': [const Color(0xFF3B82F6), const Color(0xFF2563EB)],
      'image': AppImages.taxImage,
    },
    {
      'title': 'Custodia Documental',
      'description': 'Manejo seguro de tu papelería',
      'icon': Icons.folder_special,
      'gradient': [const Color(0xFFA855F7), const Color(0xFF9333EA)],
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
  
  Future<void> launchWebsite() async {
    final Uri url = Uri.parse('https://qofin.com');
    
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
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

  Widget _buildImage(String assetPath, {BoxFit fit = BoxFit.cover, double opacity = 0.4}) {
    return Image.asset(
      assetPath,
      fit: fit,
      color: const Color.fromRGBO(0, 0, 0, 0.4),
      colorBlendMode: BlendMode.darken,
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
              SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _buildImage(
                        AppImages.heroBackground,
                        opacity: 0.4,
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      blurRadius: 4,
                                      offset: Offset(1, 1),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppImages.logo,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
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
                          
                          Container(
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.92),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  blurRadius: 30,
                                  offset: Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Expertos en\nAsesoría Financiera',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                    height: 1.3,
                                  ),
                                ),
                                
                                const SizedBox(height: 12),
                                
                                const Text(
                                  'Más de 16 años impulsando el crecimiento de negocios y personas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF64748B),
                                    height: 1.5,
                                  ),
                                ),
                                
                                const SizedBox(height: 24),
                                
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
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Servicios diseñados para tu éxito',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF64748B),
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
                              color: gradient[0].withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                  color: gradient[0].withValues(alpha: 0.7),
                                  colorBlendMode: BlendMode.color,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: gradient[0],
                                    );
                                  },
                                ),
                              ),
                              
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        gradient[0].withValues(alpha: 0.8),
                                        gradient[1].withValues(alpha: 0.9),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
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
                                            color: Colors.white.withValues(alpha: 0.2),
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
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(255, 255, 255, 0.9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white.withValues(alpha: 0.8),
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
                    }),
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
                      color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
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
                                color: const Color(0xFF22C55E).withValues(alpha: 0.1),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF22C55E),
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.format_quote,
                                color: Color(0xFF22C55E),
                                size: 40,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '"Un activo pone dinero en mi bolsillo, un pasivo lo saca de él"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF0F172A),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '— Robert Kiyosaki',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF22C55E),
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
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.statsPattern),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Opacity(
                        opacity: 0.9,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _StatCard(
                                    value: '16+',
                                    label: 'Años de\nexperiencia',
                                    icon: '⭐',
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: _StatCard(
                                    value: '180+',
                                    label: 'Clientes\nnaturales',
                                    icon: '👥',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: _StatCard(
                                    value: '20+',
                                    label: 'PYMES\natendidas',
                                    icon: '🏢',
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: _StatCard(
                                    value: '\$200K+',
                                    label: 'Recursos\nrecuperados',
                                    icon: '💰',
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
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final String icon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 15,
            offset: Offset(0, 6),
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
              color: Color(0xFF22C55E),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}