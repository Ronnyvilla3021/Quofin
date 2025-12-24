import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/bottom_nav.dart';

class ComprobantesPage extends StatefulWidget {
  const ComprobantesPage({super.key});

  @override
  State<ComprobantesPage> createState() => _ComprobantesPageState();
}

class _ComprobantesPageState extends State<ComprobantesPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() {
            _isLoading = true;
            _hasError = false;
          }),
          onPageFinished: (_) => setState(() => _isLoading = false),
          onWebResourceError: (error) => setState(() {
            _isLoading = false;
            _hasError = true;
          }),
        ),
      )
      ..loadRequest(Uri.parse('https://qofin.comprobantes-electronicos.com/WfLogin.aspx?ReturnUrl=%2f'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.receipt_long_outlined,
                color: Color(0xFF22C55E),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Comprobantes Electrónicos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          // Botón ATRÁS
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF22C55E)),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              }
            },
            tooltip: 'Atrás',
          ),
          // Botón ADELANTE
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Color(0xFF22C55E)),
            onPressed: () async {
              if (await _controller.canGoForward()) {
                _controller.goForward();
              }
            },
            tooltip: 'Adelante',
          ),
          // Botón RECARGAR
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF22C55E)),
            onPressed: () => _controller.reload(),
            tooltip: 'Recargar',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          if (!_hasError)
            WebViewWidget(controller: _controller)
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Error al cargar la página',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'No se pudo conectar con el sistema de comprobantes.\nVerifica tu conexión a internet.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _hasError = false;
                          _isLoading = true;
                        });
                        _controller.reload();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'Reintentar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_isLoading && !_hasError)
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color(0xFF22C55E),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Cargando Comprobantes Electrónicos...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}