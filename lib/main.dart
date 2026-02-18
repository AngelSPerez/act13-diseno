import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeListApp());
}

class RecipeListApp extends StatelessWidget {
  const RecipeListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const RecipeListScreen(),
    );
  }
}

class Recipe {
  final String name;
  final String time;
  final IconData icon;
  bool liked;

  Recipe({
    required this.name,
    required this.time,
    required this.icon,
    this.liked = false,
  });
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<Recipe> _allRecipes = [
    Recipe(
      name: 'Pay de Manzana',
      time: '1h 15',
      icon: Icons.pie_chart_outline,
    ),
    Recipe(name: 'Pollo', time: '35 min', icon: Icons.set_meal),
    Recipe(name: 'Cheesecake', time: '10h 45', icon: Icons.cake_outlined),
    Recipe(name: 'Galletas', time: '1h', icon: Icons.cookie_outlined),
    Recipe(name: 'Alitas', time: '1h', icon: Icons.kebab_dining),
  ];

  List<Recipe> get _filtered => _allRecipes
      .where((r) => r.name.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = _filtered;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── HEADER ─────────────────────────────────────────────
            Container(
              color: Colors.purple, // Color morado
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    // Icono de perfil
                    IconButton(
                      onPressed: () {}, // Aquí puedes agregar la lógica para abrir la pantalla de perfil
                      icon: const Icon(
                        Icons.account_circle, // Icono de perfil
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Título
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Todo (8) ▾',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color del texto
                          ),
                        ),
                      ),
                    ),
                    // Botón de grid
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.grid_view_rounded,
                        color: Colors.white,
                      ), // Color del icono
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    // Círculo
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Color del círculo
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 1, thickness: 1, color: Colors.black26),

            // ── SEARCH ROW ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (v) => setState(() => _query = v),
                        decoration: const InputDecoration(
                          hintText: 'Buscar...',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 9,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.tune, size: 22),
                  const SizedBox(width: 6),
                  const Icon(Icons.swap_vert, size: 22),
                  const SizedBox(width: 6),
                  const Icon(Icons.favorite_border, size: 22),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1, color: Colors.black26),

            // ── RECIPE LIST ─────────────────────────────────────────
            Expanded(
              child: recipes.isEmpty
                  ? const Center(
                      child: Text(
                        'Sin resultados',
                        style: TextStyle(color: Colors.black45, fontSize: 15),
                      ),
                    )
                  : ListView.separated(
                      itemCount: recipes.length,
                      separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.black26,
                      ),
                      itemBuilder: (context, index) {
                        final r = recipes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              // Image placeholder box
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                child: Icon(
                                  r.icon,
                                  size: 36,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(width: 14),

                              // Name + time
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      r.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      r.time,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Heart
                              GestureDetector(
                                onTap: () => setState(() => r.liked = !r.liked),
                                child: Icon(
                                  r.liked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 28,
                                  color: r.liked ? Colors.red : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}