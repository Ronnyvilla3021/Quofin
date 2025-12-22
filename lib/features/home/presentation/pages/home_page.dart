import 'package:flutter/material.dart';
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
    },
    {
      'title': 'Gestión Tributaria',
      'description': 'Elaboración y pago de impuestos',
      'icon': Icons.receipt_long,
      'gradient': [Color(0xFF3B82F6), Color(0xFF2563EB)],
    },
    {
      'title': 'Custodia Documental',
      'description': 'Manejo seguro de tu papelería',
      'icon': Icons.folder_special,
      'gradient': [Color(0xFFA855F7), Color(0xFF9333EA)],
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
}

// =======================
// 🧱 UI MEJORADO
// =======================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // HEADER CON GRADIENTE
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [_primaryColor, _primaryDark],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // HERO CARD
                    Padding(
                      padding: _pagePadding,
                      child: Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Icono decorativo
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [_primaryColor, _primaryDark],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.account_balance,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            
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
                              onPressed: () {},
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
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // SERVICIOS
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
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: service['gradient'],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: service['gradient'][0].withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
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
                                      service['icon'],
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service['title'],
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          service['description'],
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
                      );
                    }).toList(),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // QUOTE MEJORADO
              Padding(
                padding: _pagePadding,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _primaryColor.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
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

              const SizedBox(height: 32),

              // ESTADÍSTICAS MEJORADAS
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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: controller.stats.length,
                      itemBuilder: (_, index) {
                        final stat = controller.stats[index];
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: _cardColor,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stat['icon']!,
                                style: const TextStyle(fontSize: 32),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                stat['value']!,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: _primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                stat['label']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: _textMuted,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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