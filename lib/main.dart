import 'package:flutter/material.dart';
import 'pages/ahorro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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

  List<Map<String, dynamic>> convertirLista(List<String> datos) {
    return datos.map((item) {
      try {
        if (item.trim().startsWith('{')) {
          final mapa = Map<String, dynamic>.from(jsonDecode(item));
          mapa['valor'] = (mapa['valor'] as num).toDouble();
          mapa['pagado'] ??= false;
          mapa['fechaPago'] ??= '';
          return mapa;
        }

        final partes = item.split('|');

        return {
          'nombre': partes[0],
          'valor': double.tryParse(partes[1]) ?? 0,
          'pagado': false,
          'fechaPago': '',
        };
      } catch (_) {
        return <String, dynamic>{};
      }
    }).where((item) => item.isNotEmpty).toList();
  }

  setState(() {
    ingresos = convertirLista(ingresosGuardados);
    gastos = convertirLista(gastosGuardados);
  });
}

  Future<void> _guardarDatos() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setStringList(
    'lista_ingresos',
    ingresos.map((item) => jsonEncode(item)).toList(),
  );

  await prefs.setStringList(
    'lista_gastos',
    gastos.map((item) => jsonEncode(item)).toList(),
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

  DateTime? fechaPagoSeleccionada;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, actualizarDialogo) {
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
                  inputFormatters: [
                    FormatoMiles(),
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Valor',
                    prefixText: '\$ ',
                  ),
                ),

                if (!esIngreso) ...[
                  const SizedBox(height: 15),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Fecha de pago'),
                    subtitle: Text(
                      fechaPagoSeleccionada == null
                          ? 'Seleccionar fecha'
                          : '${fechaPagoSeleccionada!.day.toString().padLeft(2, '0')}/${fechaPagoSeleccionada!.month.toString().padLeft(2, '0')}/${fechaPagoSeleccionada!.year}',
                    ),
                    trailing: const Icon(Icons.edit_calendar),
                    onTap: () async {
                      final fecha = await showDatePicker(
                        context: context,
                        initialDate:
                            fechaPagoSeleccionada ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );

                      if (fecha != null) {
                        actualizarDialogo(() {
                          fechaPagoSeleccionada = fecha;
                        });
                      }
                    },
                  ),
                ],
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
                      'pagado': false,
                      'fechaPago': esIngreso
                          ? ''
                          : fechaPagoSeleccionada == null
                              ? ''
                              : '${fechaPagoSeleccionada!.day.toString().padLeft(2, '0')}/${fechaPagoSeleccionada!.month.toString().padLeft(2, '0')}/${fechaPagoSeleccionada!.year}',
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
    },
  );
}

  
  void _editarMovimiento({
    required bool esIngreso,
    required int indice,
  }) {
    final lista = esIngreso ? ingresos : gastos;
    final item = lista[indice];

    final nombreController =
        TextEditingController(text: item['nombre']);

    final valorController = TextEditingController(
      text: (item['valor'] as double).toStringAsFixed(0),
    );

    DateTime? fechaSeleccionada;

    if (!esIngreso) {
      final fechaGuardada =
          (item['fechaVencimiento'] ?? '').toString();

      if (fechaGuardada.isNotEmpty) {
        final partes = fechaGuardada.split('/');
        if (partes.length == 3) {
          fechaSeleccionada = DateTime(
            int.parse(partes[2]),
            int.parse(partes[1]),
            int.parse(partes[0]),
          );
        }
      } else if (!(item['pagado'] ?? false)) {
        final fechaAnterior =
            (item['fechaPago'] ?? '').toString();

        if (fechaAnterior.isNotEmpty) {
          final partes = fechaAnterior.split('/');
          if (partes.length == 3) {
            fechaSeleccionada = DateTime(
              int.parse(partes[2]),
              int.parse(partes[1]),
              int.parse(partes[0]),
            );
          }
        }
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, actualizarDialogo) {
            return AlertDialog(
              title: Text(
                esIngreso ? 'Editar ingreso' : 'Editar gasto',
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
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
                    if (!esIngreso) ...[
                      const SizedBox(height: 15),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Fecha programada de pago'),
                        subtitle: Text(
                          fechaSeleccionada == null
                              ? 'Sin fecha'
                              : '${fechaSeleccionada!.day.toString().padLeft(2, '0')}/${fechaSeleccionada!.month.toString().padLeft(2, '0')}/${fechaSeleccionada!.year}',
                        ),
                        trailing: const Icon(Icons.calendar_month),
                        onTap: () async {
                          final fecha = await showDatePicker(
                            context: context,
                            initialDate:
                                fechaSeleccionada ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );

                          if (fecha != null) {
                            actualizarDialogo(() {
                              fechaSeleccionada = fecha;
                            });
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          actualizarDialogo(() {
                            fechaSeleccionada = null;
                          });
                        },
                        child: const Text('Quitar fecha'),
                      ),
                    ],
                  ],
                ),
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
                      item['nombre'] = nombre;
                      item['valor'] = valor;

                      if (!esIngreso) {
                        item['fechaVencimiento'] =
                            fechaSeleccionada == null
                                ? ''
                                : '${fechaSeleccionada!.day.toString().padLeft(2, '0')}/${fechaSeleccionada!.month.toString().padLeft(2, '0')}/${fechaSeleccionada!.year}';
                      }
                    });

                    await _guardarDatos();

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Guardar cambios'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  Future<void> _eliminar({
  required bool esIngreso,
  required int indice,
}) async {
  final confirmar = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmar eliminación'),
      content: Text(
        '¿Está seguro de que desea eliminar este ${esIngreso ? 'ingreso' : 'gasto'}?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Eliminar'),
        ),
      ],
    ),
  );

  if (confirmar != true) return;

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
                      '\$${NumberFormat('#,##0', 'es_CO').format(disponible)}',
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
            '\$${NumberFormat('#,##0', 'es_CO').format(valor)}',
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

  Future<void> _cambiarEstadoPago(int indice) async {
  setState(() {
    final ahora = DateTime.now();

    if (!(gastos[indice]['pagado'] ?? false)) {
      gastos[indice]['pagado'] = true;
      gastos[indice]['fechaPago'] =
          '${ahora.day.toString().padLeft(2, '0')}/${ahora.month.toString().padLeft(2, '0')}/${ahora.year}';
    } else {
      gastos[indice]['pagado'] = false;
      gastos[indice]['fechaPago'] = '';
    }
  });

  await _guardarDatos();
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
          style: TextStyle(color: Colors.grey.shade400),
        ),
      );
    }

    return Column(
      children: List.generate(lista.length, (indice) {
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
                    '\$${NumberFormat('#,##0', 'es_CO').format(item['valor'])}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!esIngreso)
                    TextButton.icon(
                      onPressed: () {
                        _cambiarEstadoPago(indice);
                      },
                      icon: Icon(
                        (item['pagado'] ?? false)
                            ? Icons.check_circle
                            : Icons.pending_outlined,
                        color: (item['pagado'] ?? false)
                            ? Colors.green
                            : Colors.orange,
                      ),
                      

label: Text(
  (item['pagado'] ?? false)
      ? 'Pagado${item['fechaPago'] != null && item['fechaPago'].toString().isNotEmpty ? ' • ${item['fechaPago']}' : ''}${item['fechaVencimiento'] != null && item['fechaVencimiento'].toString().isNotEmpty ? '\nPróximo pago: ${item['fechaVencimiento']} • ${(() { final p = item['fechaVencimiento'].toString().split('/'); if (p.length != 3) return ''; final f = DateTime(int.parse(p[2]), int.parse(p[1]), int.parse(p[0])); final h = DateTime.now(); final hoy = DateTime(h.year, h.month, h.day); final d = f.difference(hoy).inDays; return d > 0 ? '$d días' : d == 0 ? 'Hoy' : '$d días'; })()}' : ''
      : 'Pendiente${(item['fechaVencimiento'] ?? item['fechaPago'] ?? '').toString().isNotEmpty ? ' • ${item['fechaVencimiento'] ?? item['fechaPago']} • ${(() { final r = (item['fechaVencimiento'] ?? item['fechaPago']).toString(); final p = r.split('/'); if (p.length != 3) return ''; final f = DateTime(int.parse(p[2]), int.parse(p[1]), int.parse(p[0])); final h = DateTime.now(); final hoy = DateTime(h.year, h.month, h.day); final d = f.difference(hoy).inDays; return d > 0 ? '$d días' : d == 0 ? 'Hoy' : '$d días'; })()}' : '',
  style: TextStyle(
    color: (item['pagado'] ?? false)
        ? Colors.green
        : Colors.orange,
  ),
),

                    ),
                  if (!esIngreso)
                    IconButton(
                      tooltip: 'Crear alerta',
                      onPressed: () {
                        _mostrarAlerta(indice: indice);
                      },
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 22,
                      ),
                    ),
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
      }),
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
            builder: (context) => const HabitosPage(),
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



class HabitosPage extends StatefulWidget {
  const HabitosPage({super.key});

  @override
  State<HabitosPage> createState() => _HabitosPageState();
}

class _HabitosPageState extends State<HabitosPage> {
  List<Map<String, dynamic>> habitos = [];

  @override
  void initState() {
    super.initState();
    _cargarHabitos();
  }

  Future<void> _cargarHabitos() async {
    final prefs = await SharedPreferences.getInstance();
    final datos = prefs.getStringList('lista_habitos') ?? [];

    setState(() {
      habitos = datos.map((item) {
        final partes = item.split('|');
        return {
          'nombre': partes[0],
          'completado': partes.length > 1 && partes[1] == '1',
        };
      }).toList();
    });
  }

  Future<void> _guardarHabitos() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'lista_habitos',
      habitos.map((h) =>
        '${h['nombre']}|${h['completado'] == true ? '1' : '0'}'
      ).toList(),
    );
  }

  void _crearHabito() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Crear mi hábito'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Nombre del hábito',
            hintText: 'Ej: Ahorrar todos los días',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              final nombre = controller.text.trim();

              if (nombre.isEmpty) return;

              setState(() {
                habitos.add({
                  'nombre': nombre,
                  'completado': false,
                });
              });

              await _guardarHabitos();

              if (dialogContext.mounted) {
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Guardar hábito'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final completados =
        habitos.where((h) => h['completado'] == true).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis hábitos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _crearHabito,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo hábito'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Construye buenos hábitos 🌱',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Pequeñas acciones diarias construyen grandes resultados.',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00C9A7),
                      Color(0xFF087F8C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Hábitos completados: $completados de ${habitos.length}',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Mi lista de hábitos',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: habitos.isEmpty
                    ? Center(
                        child: Text(
                          'Todavía no tienes hábitos.\nPulsa “Nuevo hábito” para comenzar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: habitos.length,
                        itemBuilder: (context, index) {
                          final habito = habitos[index];

                          return Card(
                            color: const Color(0xFF151C31),
                            margin: const EdgeInsets.only(bottom: 12),
                            child: CheckboxListTile(
                              value: habito['completado'],
                              activeColor: const Color(0xFF00C9A7),
                              title: Text(
                                habito['nombre'],
                                style: TextStyle(
                                  decoration:
                                      habito['completado'] == true
                                          ? TextDecoration.lineThrough
                                          : null,
                                ),
                              ),
                              secondary: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () async {
                                  setState(() {
                                    habitos.removeAt(index);
                                  });
                                  await _guardarHabitos();
                                },
                              ),
                              onChanged: (valor) async {
                                setState(() {
                                  habito['completado'] = valor ?? false;
                                });
                                await _guardarHabitos();
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormatoMiles extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String numeros = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeros.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final formato = NumberFormat('#,###', 'es_CO');
    final valor = formato.format(int.parse(numeros));

    return TextEditingValue(
      text: valor,
      selection: TextSelection.collapsed(offset: valor.length),
    );
  }
}
