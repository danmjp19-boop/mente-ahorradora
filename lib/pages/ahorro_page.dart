
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AhorroPage extends StatefulWidget {
  const AhorroPage({super.key});

  @override
  State<AhorroPage> createState() => _AhorroPageState();
}

class _AhorroPageState extends State<AhorroPage> {
  List<Map<String, dynamic>> metas = [];
  final formato = NumberFormat('#,##0', 'es_CO');

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    final datos = prefs.getStringList('mis_metas_ahorro') ?? [];

    setState(() {
      metas = datos.map((dato) {
        final partes = dato.split('|');
        return {
          'nombre': partes[0],
          'objetivo': double.tryParse(partes[1]) ?? 0,
          'ahorrado': double.tryParse(partes[2]) ?? 0,
        };
      }).toList();
    });
  }

  Future<void> _guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'mis_metas_ahorro',
      metas.map((meta) =>
        '${meta['nombre']}|${meta['objetivo']}|${meta['ahorrado']}'
      ).toList(),
    );
  }

  double get totalAhorrado => metas.fold(
    0,
    (total, meta) => total + (meta['ahorrado'] as double),
  );

  void _crearMeta() {
    final nombre = TextEditingController();
    final objetivo = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Crear meta de ahorro'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombre,
              decoration: const InputDecoration(
                labelText: '¿Para qué quieres ahorrar?',
              ),
            ),
            TextField(
              controller: objetivo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor de tu meta',
                prefixText: '\$ ',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              final valor = double.tryParse(
                objetivo.text.replaceAll('.', '').replaceAll(',', '.'),
              );

              if (nombre.text.trim().isEmpty ||
                  valor == null || valor <= 0) return;

              setState(() {
                metas.add({
                  'nombre': nombre.text.trim(),
                  'objetivo': valor,
                  'ahorrado': 0.0,
                });
              });

              await _guardarDatos();

              if (dialogContext.mounted) {
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Crear meta'),
          ),
        ],
      ),
    );
  }

  void _agregarAporte(int indice) {
    final aporte = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Agregar ahorro'),
        content: TextField(
          controller: aporte,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: '¿Cuánto vas a ahorrar?',
            prefixText: '\$ ',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              final valor = double.tryParse(
                aporte.text.replaceAll('.', '').replaceAll(',', '.'),
              );

              if (valor == null || valor <= 0) return;

              setState(() {
                metas[indice]['ahorrado'] =
                    (metas[indice]['ahorrado'] as double) + valor;
              });

              await _guardarDatos();

              if (dialogContext.mounted) {
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Guardar aporte'),
          ),
        ],
      ),
    );
  }

  Future<void> _eliminarMeta(int indice) async {
    setState(() {
      metas.removeAt(indice);
    });
    await _guardarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi ahorro 💰',
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
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
                      'Total de mis ahorros',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${formato.format(totalAhorrado)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('${metas.length} metas creadas'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Mis metas de ahorro',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              if (metas.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151C31),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    'Todavía no tienes metas. '
                    'Crea tu primera meta y comienza a ahorrar.',
                  ),
                ),

              ...List.generate(metas.length, (indice) {
                final meta = metas[indice];
                final objetivo = meta['objetivo'] as double;
                final ahorrado = meta['ahorrado'] as double;
                final progreso = objetivo > 0
                    ? (ahorrado / objetivo).clamp(0.0, 1.0)
                    : 0.0;

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151C31),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              meta['nombre'],
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _eliminarMeta(indice),
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${formato.format(ahorrado)} de '
                        '\$${formato.format(objetivo)}',
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progreso,
                          minHeight: 10,
                          backgroundColor: Colors.white12,
                          color: const Color(0xFF00C9A7),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('${(progreso * 100).toStringAsFixed(1)}% completado'),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () => _agregarAporte(indice),
                          icon: const Icon(Icons.add),
                          label: const Text('Agregar ahorro'),
                        ),
                      ),
                      if (ahorrado >= objetivo)
                        const Text(
                          '🎉 ¡Meta alcanzada!',
                          style: TextStyle(
                            color: Color(0xFF00C9A7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _crearMeta,
                  icon: const Icon(Icons.add),
                  label: const Text('Crear nueva meta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
