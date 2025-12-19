import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
// 🧠 LÓGICA / CONTROLLER
// =======================

class ContactController {
  String get title => 'Hablemos';
  String get subtitle =>
      'Estamos listos para ayudarte de forma clara y profesional';

  List<Map<String, String>> get actions => [
    {
      'title': 'WhatsApp General',
      'subtitle': 'Asesoría rápida',
      'icon': 'https://cdn-icons-png.flaticon.com/512/733/733585.png',
      'url': 'https://wa.me/593980030415',
    },
    {
      'title': 'Matriz',
      'subtitle': '09 8003 0415',
      'icon': 'https://cdn-icons-png.flaticon.com/512/724/724664.png',
      'url': 'tel:+593980030415',
    },
    {
      'title': 'Email',
      'subtitle': 'sac@qofin.com',
      'icon': 'https://cdn-icons-png.flaticon.com/512/732/732200.png',
      'url': 'mailto:sac@qofin.com',
    },
  ];

  String get address =>
      'José Arízaga 112 y Jorge Drom\n'
      'Edificio Aristo Plaza\n'
      'Oficina No. 11 (Matriz)';

  String get mapsUrl => 'https://www.google.com/maps?q=-2.900771,-79.005881';

  List<Map<String, String>> get socials => [
    {
      'label': 'Instagram',
      'icon': 'https://cdn-icons-png.flaticon.com/512/2111/2111463.png',
      'url': 'https://www.instagram.com/qofinec/',
    },
    {
      'label': 'Facebook',
      'icon': 'https://cdn-icons-png.flaticon.com/512/124/124010.png',
      'url': 'https://www.facebook.com/QOFINEC',
    },
  ];
}

// =======================
// 🧱 UI (LAYOUT)
// =======================

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _open(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ContactController();

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Padding(
            padding: _pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                  child: Column(
                    children: [
                      Text(
                        controller.title,
                        style: const TextStyle(
                          fontSize: _titleSize,
                          fontWeight: FontWeight.bold,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        controller.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: _bodySize,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ACCIONES
                ...controller.actions.map(
                  (action) => GestureDetector(
                    onTap: () => _open(action['url']!),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: _cardColor,
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              action['icon']!,
                              width: 42,
                              height: 42,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                action['title']!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: _textPrimary,
                                ),
                              ),
                              Text(
                                action['subtitle']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: _textMuted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // DIRECCIÓN + MAPS
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '📍 Dirección',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.address,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 13, color: _textMuted),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () => _open(controller.mapsUrl),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Abrir en Google Maps'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // REDES
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '🌐 Redes Sociales',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children:
                            controller.socials.map((social) {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () => _open(social['url']!),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: _bgColor,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          social['icon']!,
                                          width: 22,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          social['label']!,
                                          style: const TextStyle(
                                            color: _textPrimary,
                                          ),
                                        ),
                                      ],
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
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
