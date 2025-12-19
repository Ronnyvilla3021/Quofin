import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS (CSS)
// =======================

const Color _bgColor = Color(0xFFF8FAFC);
const Color _cardColor = Colors.white;
const Color _primaryColor = Colors.green;
const Color _textPrimary = Color(0xFF0F172A);
const Color _textMuted = Color(0xFF64748B);

const double _titleSize = 24;
const double _bodySize = 15;

const EdgeInsets _pagePadding = EdgeInsets.all(16);

// =======================
// 🧠 LÓGICA / ESTADO
// =======================

class AboutController {
  String get heroTitle =>
      'Más que contadores,\nsomos aliados de tu crecimiento';

  String get manifesto =>
      'No creemos en la contabilidad fría ni complicada.\n'
      'Creemos en claridad, orden y tranquilidad.\n'
      'Acompañamos a personas y empresas a tomar\n'
      'decisiones financieras con confianza.';

  List<Map<String, String>> get cards => [
    {
      'title': '🎯 Nuestra misión',
      'text':
          'Convertir la contabilidad en una herramienta clara, útil y comprensible.',
    },
    {
      'title': '👁️ Nuestra visión',
      'text':
          'Ser la firma contable que se recomienda por cercanía y resultados reales.',
    },
  ];

  List<String> get values => [
    'Responsabilidad',
    'Compromiso',
    'Transparencia',
    'Trabajo en equipo',
    'Confianza',
  ];

  String get experienceTitle => '⭐ Experiencia que respalda';

  String get experienceText =>
      'Más de 10 años acompañando negocios, emprendedores y profesionales.';
}

// =======================
// 🧱 UI (LAYOUT)
// =======================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutController();

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Padding(
            padding: _pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IMAGEN
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=800',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 24),

                // HERO
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Text(
                    controller.heroTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: _titleSize,
                      fontWeight: FontWeight.bold,
                      color: _textPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // MANIFIESTO
                Text(
                  controller.manifesto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: _bodySize,
                    height: 1.6,
                    color: _textMuted,
                  ),
                ),

                const SizedBox(height: 28),

                // MISIÓN & VISIÓN
                Row(
                  children:
                      controller.cards.map((card) {
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: _cardColor,
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.05),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  card['title']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: _primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  card['text']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: _textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 24),

                // VALORES - usamos todos los valores
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children:
                      controller.values
                          .map(
                            (value) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _primaryColor.withOpacity(.12),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: _primaryColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),

                const SizedBox(height: 30),

                // EXPERIENCIA
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        controller.experienceTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.experienceText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: _bodySize,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ✅ Menú inferior visible
      bottomNavigationBar: const BottomNav(),
    );
  }
}
