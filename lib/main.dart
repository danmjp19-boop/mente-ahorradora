import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Map<String, dynamic>> ingresos = [];
  List<Map<String, dynamic>> gastos = [];

  final List<String> ingresosBase = [
    'Sueldo',
    'Honorarios',
    'Negocio',
    'Otros ingresos',
  ];

  final List<String> gastosBase = [
    'Arriendo',
    'Transporte',
    'Alimentación',
    'Servicios',
    'Mercado',
    'Gasolina',
    'Salud',
    'Educación',
    'Deudas',
    'Entretenimiento',
    'Otros gastos',
  ];

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    final prefs = await SharedPreferences.getInstance();

    final ingresosGuardados =
        prefs.getStringList('lista_ingresos') ?? [];

    final gastosGuardados =
        prefs.getStringList('lista_gastos') ?? [];

    setState(() {
      ingresos = ingresosGuardados.map((item) {
        final partes = item.split('|');

        return {
          'nombre': partes[0],
          'valor': double.tryParse(partes[1]) ?? 0,
        };
      }).toList();

      gastos = gastosGuardados.map((item) {
        final partes = item.split('|');

        return {
          'nombre': partes[0],
          'valor': double.tryParse(partes[1]) ?? 0,
        };
      }).toList();
    });
  }

  Future<void> _guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'lista_ingresos',
      ingresos
          .map((item) => '${item['nombre']}|${item['valor']}')
          .toList(),
    );

    await prefs.setStringList(
      'lista_gastos',
      gastos
          .map((item) => '${item['nombre']}|${item['valor']}')
          .toList(),
    );
  }

  double _total(List<Map<String, dynamic>> lista) {
    return lista.fold(
      0,
      (total, item) => total + (item['valor'] as double),
    );
  }

  void _mostrarFormulario({
    required bool esIngreso,
    String? nombreInicial,
  }) {
    final nombreController =
        TextEditingController(text: nombreInicial ?? '');

    final valorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            esIngreso ? 'Nuevo ingreso' : 'Nuevo gasto',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ej: Sueldo',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: valorController,
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  prefixText: '\$ ',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () async {
                final nombre =
                    nombreController.text.trim();

                final valor = double.tryParse(
                  valorController.text
                      .replaceAll('.', '')
                      .replaceAll(',', '.'),
                );

                if (nombre.isEmpty ||
                    valor == null ||
                    valor <= 0) {
                  return;
                }

                setState(() {
                  final nuevo = {
                    'nombre': nombre,
                    'valor': valor,
                  };

                  if (esIngreso) {
                    ingresos.add(nuevo);
                  } else {
                    gastos.add(nuevo);
                  }
                });

                await _guardarDatos();

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _eliminar({
    required bool esIngreso,
    required int indice,
  }) async {
    setState(() {
      if (esIngreso) {
        ingresos.removeAt(indice);
      } else {
        gastos.removeAt(indice);
      }
    });

    await _guardarDatos();
  }

  @override
  Widget build(BuildContext context) {
    final totalIngresos = _total(ingresos);
    final totalGastos = _total(gastos);
    final disponible = totalIngresos - totalGastos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi dinero',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Mi dinero 💰',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Organiza tus ingresos y gastos de forma sencilla.',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
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
                  borderRadius:
                      BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dinero disponible',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${disponible.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: _resumen(
                      'Ingresos',
                      totalIngresos,
                      Icons.arrow_downward,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _resumen(
                      'Gastos',
                      totalGastos,
                      Icons.arrow_upward,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _tituloSeccion(
                'Ingresos',
                Icons.account_balance_wallet_outlined,
              ),

              const SizedBox(height: 12),

              _listaMovimientos(
                lista: ingresos,
                esIngreso: true,
              ),

              const SizedBox(height: 15),

              OutlinedButton.icon(
                onPressed: () {
                  _mostrarFormulario(
                    esIngreso: true,
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Crear ingreso'),
              ),

              const SizedBox(height: 30),

              _tituloSeccion(
                'Gastos',
                Icons.money_off,
              ),

              const SizedBox(height: 12),

              _listaMovimientos(
                lista: gastos,
                esIngreso: false,
              ),

              const SizedBox(height: 15),

              OutlinedButton.icon(
                onPressed: () {
                  _mostrarFormulario(
                    esIngreso: false,
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Crear gasto'),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF151C31),
                  borderRadius:
                      BorderRadius.circular(18),
                ),
                child: const Text(
                  '💡 Consejo: primero registra tus ingresos y después agrega tus gastos. Así podrás saber cuánto dinero realmente tienes disponible.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumen(
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
        crossAxisAlignment:
            CrossAxisAlignment.start,
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

  Widget _tituloSeccion(
    String titulo,
    IconData icono,
  ) {
    return Row(
      children: [
        Icon(
          icono,
          color: const Color(0xFF00C9A7),
        ),
        const SizedBox(width: 10),
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

 Future<void> _mostrarAlerta({
  required int indice,
}) async {
  final gasto = gastos[indice];

  final fecha = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (fecha == null) return;

  if (!mounted) return;

  final hora = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (hora == null) return;

  if (!mounted) return;

  int diasAntes = 0;

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('🔔 Alerta del gasto'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  gasto['nombre'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'Aviso: ${fecha.day}/${fecha.month}/${fecha.year} '
                  'a las ${hora.format(context)}',
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<int>(
                  value: diasAntes,
                  decoration: const InputDecoration(
                    labelText: 'Avisar con anticipación',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('El mismo día'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('1 día antes'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3 días antes'),
                    ),
                    DropdownMenuItem(
                      value: 7,
                      child: Text('7 días antes'),
                    ),
                  ],
                  onChanged: (valor) {
                    if (valor != null) {
                      setDialogState(() {
                        diasAntes = valor;
                      });
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Guardar alerta'),
              ),
            ],
          );
        },
      );
    },
  );

  if (!mounted) return;

  setState(() {
    gasto['alertaFecha'] =
        '${fecha.year}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}';

    gasto['alertaHora'] =
        '${hora.hour.toString().padLeft(2, '0')}:${hora.minute.toString().padLeft(2, '0')}';

    gasto['alertaDiasAntes'] = diasAntes;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('🔔 Alerta creada correctamente'),
    ),
  );
} 

  Widget _listaMovimientos({
  required List<Map<String, dynamic>> lista,
  required bool esIngreso,
}) {
  if (lista.isEmpty) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151C31),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        esIngreso
            ? 'Todavía no tienes ingresos registrados.'
            : 'Todavía no tienes gastos registrados.',
        style: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  return Column(
    children: List.generate(
      lista.length,
      (indice) {
        final item = lista[indice];

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
          decoration: BoxDecoration(
            color: const Color(0xFF151C31),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              // PARTE SUPERIOR
              Row(
                children: [
                  Icon(
                    esIngreso
                        ? Icons.add_circle_outline
                        : Icons.remove_circle_outline,
                    color: const Color(0xFF00C9A7),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      item['nombre'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    '\$${(item['valor'] as double).toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ✏️ EDITAR ARRIBA A LA DERECHA
                  IconButton(
                    tooltip: 'Editar',
                    onPressed: () {
                      _editarMovimiento(
                        esIngreso: esIngreso,
                        indice: indice,
                      );
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 21,
                    ),
                  ),
                ],
              ),

              // BOTONES INFERIORES
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // 🔔 ALERTA
                  if (!esIngreso)
                    IconButton(
                      tooltip: 'Crear alerta',
                      onPressed: () {
                        _mostrarAlerta(
                          indice: indice,
                        );
                      },
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 22,
                      ),
                    ),

                  // 🗑️ ELIMINAR
                  IconButton(
                    tooltip: 'Eliminar',
                    onPressed: () {
                      _eliminar(
                        esIngreso: esIngreso,
                        indice: indice,
                      );
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 21,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
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
            builder: (context) => const CaminoPage(),
          ),
        );
      } else if (titulo == 'Crear una meta') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CaminoPage(),
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
