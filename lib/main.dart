import 'package:flutter/material.dart';

void main() {
  runApp(const HabitosDeRiquezaApp());
}

class HabitosDeRiquezaApp extends StatelessWidget {
  const HabitosDeRiquezaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hábitos de Riqueza',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C9A7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hábitos de Riqueza 💰',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text(
                'Construye tu riqueza,\nun hábito a la vez.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                'No se trata de ganar más solamente. '
                'Se trata de aprender a administrar mejor lo que ya tienes.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              _tarjetaPrincipal(),

              const SizedBox(height: 25),

              const Text(
                'Tus hábitos de hoy',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _tarjetaEstadistica(
                      icono: Icons.savings_outlined,
                      titulo: 'Ahorro',
                      valor: '\$0',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _tarjetaEstadistica(
                      icono: Icons.track_changes,
                      titulo: 'Metas',
                      valor: '0',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                'Principios de riqueza',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _principio(
                Icons.psychology_outlined,
                'Mentalidad',
                'Piensa a largo plazo y toma decisiones conscientes con tu dinero.',
              ),

              _principio(
                Icons.savings_outlined,
                'Ahorro',
                'Haz del ahorro un hábito antes de convertirlo en una obligación.',
              ),

              _principio(
                Icons.trending_up,
                'Crecimiento',
                'Pequeñas mejoras constantes pueden convertirse en grandes resultados.',
              ),

              const SizedBox(height: 30),

              SizedBox(
  width: double.infinity,
  child: FilledButton.icon(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CaminoPage(),
        ),
      );
    },
    icon: const Icon(Icons.arrow_forward),
    label: const Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Text(
        'Comenzar mi camino',
        style: TextStyle(fontSize: 16),
      ),
    ),
  ),
),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tarjetaPrincipal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF00C9A7),
            Color(0xFF087F8C),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(height: 18),
          Text(
            'Tu riqueza comienza con una decisión.',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Organiza tu dinero, crea hábitos y trabaja por tus metas.',
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tarjetaEstadistica({
    required IconData icono,
    required String titulo,
    required String valor,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151C31),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icono,
            color: const Color(0xFF00C9A7),
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            titulo,
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _principio(
    IconData icono,
    String titulo,
    String descripcion,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF151C31),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icono,
            color: const Color(0xFF00C9A7),
            size: 30,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  descripcion,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CaminoPage extends StatelessWidget {
  const CaminoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi camino',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comienza tu camino 💰',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Vamos a construir tus hábitos financieros paso a paso.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              _opcion(
                context,
                Icons.account_balance_wallet_outlined,
                'Organizar mi dinero',
                'Conoce cuánto tienes y cómo estás utilizando tu dinero.',
              ),

              _opcion(
                context,
                Icons.savings_outlined,
                'Crear mi primer hábito',
                'Empieza con un hábito sencillo de ahorro.',
              ),

              _opcion(
                context,
                Icons.flag_outlined,
                'Crear una meta',
                'Define algo que quieras conseguir y cuánto necesitas.',
              ),
            ],
          ),
        ),
      ),
    );
  }    
}

class DineroPage extends StatefulWidget {
  const DineroPage({super.key});

  @override
  State<DineroPage> createState() => _DineroPageState();
}

class _DineroPageState extends State<DineroPage> {
  double ingresos = 0;
  double gastos = 0;

  final TextEditingController _montoController =
      TextEditingController();

  void _agregarIngreso() {
    final monto = double.tryParse(_montoController.text);

    if (monto == null || monto <= 0) {
      _mensaje('Escribe un monto válido.');
      return;
    }

    setState(() {
      ingresos += monto;
    });

    _montoController.clear();
    _mensaje('Ingreso agregado correctamente.');
  }

  void _agregarGasto() {
    final monto = double.tryParse(_montoController.text);

    if (monto == null || monto <= 0) {
      _mensaje('Escribe un monto válido.');
      return;
    }

    setState(() {
      gastos += monto;
    });

    _montoController.clear();
    _mensaje('Gasto agregado correctamente.');
  }

  void _mensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  @override
  void dispose() {
    _montoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double saldo = ingresos - gastos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi dinero',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Organiza tu dinero 💰',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Registra lo que recibes y lo que gastas para saber exactamente cómo están tus finanzas.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00C9A7),
                      Color(0xFF087F8C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Saldo disponible',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${saldo.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _estadistica(
                      'Ingresos',
                      ingresos,
                      Icons.arrow_downward,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _estadistica(
                      'Gastos',
                      gastos,
                      Icons.arrow_upward,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Registrar movimiento',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _montoController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Monto',
                  hintText: 'Ejemplo: 50000',
                  prefixText: '\$ ',
                  filled: true,
                  fillColor: const Color(0xFF151C31),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _agregarIngreso,
                      icon: const Icon(Icons.add),
                      label: const Text('Ingreso'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _agregarGasto,
                      icon: const Icon(Icons.remove),
                      label: const Text('Gasto'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF151C31),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFF00C9A7),
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'Consejo: registra tus movimientos diariamente para conocer mejor tus hábitos financieros.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _estadistica(
    String titulo,
    double valor,
    IconData icono,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF151C31),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icono,
            color: const Color(0xFF00C9A7),
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${valor.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _opcion(
  BuildContext context,
  IconData icono,
  String titulo,
  String descripcion,
) {
  return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: () {
      if (titulo == 'Organizar mi dinero') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DineroPage(),
          ),
        );
      } else if (titulo == 'Crear mi primer hábito') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HabitoPage(),
          ),
        );
      } else if (titulo == 'Crear una meta') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MetaPage(),
          ),
        );
      }
    },
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151C31),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icono,
            color: const Color(0xFF00C9A7),
            size: 32,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  descripcion,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
