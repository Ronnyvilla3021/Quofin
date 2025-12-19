import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

// =======================
// 🎨 ESTILOS (CSS)
// =======================

const Color _primaryColor = Color(0xFF22C55E); // verde fintech
const Color _backgroundColor = Color(0xFFF9FAFB);
const Color _cardColor = Colors.white;
const Color _textPrimary = Color(0xFF0F172A);
const Color _textMuted = Color(0xFF64748B);

const double _titleSize = 26;
const double _bodySize = 15;

const EdgeInsets _pagePadding = EdgeInsets.all(16);

const Color _quoteColor = Color(0xFF64748B);

const Color _accentColor = Colors.green;

// =======================
// 🧠 LÓGICA / ESTADO (SCRIPT)
// =======================

class HomeController {
  String get title => 'Home';

  List<String> get services => [
    'Asesoría Financiera y Tributaria',
    'Elaboración y pago de impuestos',
    'Manejo y custodia de papelería',
  ];
  String get quote =>
      '“Un activo pone dinero en mi bolsillo, un pasivo lo saca de él”\n— Robert Kiyosaki';

  List<Map<String, String>> get stats => [
    {'value': '16', 'label': 'Años de experiencia'},
    {'value': '180+', 'label': 'Clientes naturales'},
    {'value': '20+', 'label': 'PYMES'},
    {'value': '200K+', 'label': 'Recuperado'},
  ];
}

// =======================
// 🧱 UI (LAYOUT)
// =======================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text(controller.title),
        backgroundColor: _primaryColor,
      ),
      body: SingleChildScrollView(
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
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Expertos en Asesoría Financiera',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: _titleSize,
                        fontWeight: FontWeight.bold,
                        color: _textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Más de 16 años ayudando a crecer negocios y personas',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: _bodySize,
                        color: _textMuted,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Visita nuestra web'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ¿QUÉ HACEMOS?
              const Text(
                '¿Qué hacemos?',
                style: TextStyle(
                  fontSize: _titleSize - 2,
                  fontWeight: FontWeight.bold,
                  color: _textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              ...controller.services.map(
                (service) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.04),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Text(
                    service,
                    style: const TextStyle(
                      fontSize: _bodySize,
                      color: _textMuted,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                controller.quote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: _quoteColor,
                ),
              ),
              const SizedBox(height: 32),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: controller.stats.length,
                itemBuilder: (_, index) {
                  final stat = controller.stats[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stat['value']!,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: _accentColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          stat['label']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: _textMuted,
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
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
