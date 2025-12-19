class ServiceItem {
  final String title;
  final String subtitle;
  final String url;
  final String emoji;

  ServiceItem({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.emoji,
  });
}

class ServicesController {
  List<ServiceItem> get services => [
    ServiceItem(
      title: 'CRM Empresarial',
      subtitle: 'Gestión de clientes y procesos',
      url: 'https://qofin.com/crm/',
      emoji: '📊',
    ),
    ServiceItem(
      title: 'Comprobantes Electrónicos',
      subtitle: 'Facturación electrónica',
      url:
          'https://qofin.comprobantes-electronicos.com/WfLogin.aspx?ReturnUrl=%2f',
      emoji: '🧾',
    ),
    ServiceItem(
      title: 'Perseo App',
      subtitle: 'Gestión contable y financiera',
      url: 'https://perseo.app/inicio',
      emoji: '⚡',
    ),
  ];
}
