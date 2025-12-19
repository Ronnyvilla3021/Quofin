import 'package:flutter/material.dart';
import '../controllers/services_controller.dart';
import 'webview_page.dart';
import '../../../home/presentation/widgets/bottom_nav.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final controller = ServicesController();

  int _currentWebViewIndex =
      -1; // -1 = lista de servicios, 0/1/2 = webview abierto

  WebViewPage? _currentWebView;

  void _openWebView(int index) {
    setState(() {
      _currentWebViewIndex = index;
      _currentWebView = WebViewPage(
        url: controller.services[index].url,
        title: controller.services[index].title,
        onBack: () {
          setState(() {
            _currentWebViewIndex = -1;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        backgroundColor: Colors.green,
      ),
      body:
          _currentWebViewIndex == -1
              ? ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.services.length,
                itemBuilder: (_, index) {
                  final service = controller.services[index];

                  return GestureDetector(
                    onTap: () => _openWebView(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.08),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            service.emoji,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  service.subtitle,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  );
                },
              )
              : _currentWebView, // mostrar webview dentro del mismo scaffold
      bottomNavigationBar: const BottomNav(),
    );
  }
}
