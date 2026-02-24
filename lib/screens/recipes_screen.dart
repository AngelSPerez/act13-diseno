import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
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
    const primaryColor = Color(0xFF7C6FCD);
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
    const onSurface = Color(0xFF1B1B1F);
    final onSurfaceMuted = onSurface.withOpacity(0.55);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFE),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Todo (8) ▾',
          style: textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle, color: Colors.white, size: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(color: onSurface, width: 1.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _query = v),
                      style: const TextStyle(fontSize: 14, color: onSurface),
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        hintStyle: TextStyle(
                          color: onSurfaceMuted,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 9,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.tune, size: 22, color: onSurface),
                const SizedBox(width: 6),
                Icon(Icons.swap_vert, size: 22, color: onSurface),
                const SizedBox(width: 6),
                Icon(Icons.favorite_border, size: 22, color: onSurface),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: onSurface.withOpacity(0.2)),
          Expanded(
            child: recipes.isEmpty
                ? Center(
                    child: Text(
                      'Sin resultados',
                      style: TextStyle(color: onSurfaceMuted, fontSize: 15),
                    ),
                  )
                : ListView.separated(
                    itemCount: recipes.length,
                    separatorBuilder: (_, __) => Divider(
                      height: 1,
                      thickness: 1,
                      color: onSurface.withOpacity(0.2),
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
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: onSurface,
                                  width: 1.5,
                                ),
                                color: const Color(0xFFF4EFF4),
                              ),
                              child: Icon(
                                r.icon,
                                size: 36,
                                color: onSurfaceMuted,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    r.name,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    r.time,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: onSurfaceMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => r.liked = !r.liked),
                              child: Icon(
                                r.liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 28,
                                color: r.liked ? Colors.red : onSurface,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        backgroundColor: primaryColor,
        child: const Icon(Icons.logout, color: Colors.white),
      ),
    );
  }
}
