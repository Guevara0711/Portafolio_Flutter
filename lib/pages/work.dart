import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Ahora esperamos que el widget se construya y ajustamos la posición inicial
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        // Ajustamos la posición inicial a 0 para que empiece bajo el header
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.fromLTRB(
          20.0, 
          100.0,  // Ajustado a 90.0 para que el contenido empiece más abajo
          20.0, 
          isMobile ? 100.0 : 20.0
        ),
        // Añadimos un ClipRect para asegurar que el scroll no se salga de los límites
        child: ClipRect(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildCard(
                    title: "Microsoft Dynamics",
                    tags: ["UX Design", "Research"],
                    description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                    imageUrl: "assets/images/Estación Otemachi_.jpeg",
                  ),
                  _buildCard(
                    title: "Microsoft Dynamics",
                    tags: ["UX Design", "Research"],
                    description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                    imageUrl: "assets/images/Estación Otemachi_.jpeg",
                  ),
                  _buildCard(
                    title: "Microsoft Dynamics",
                    tags: ["UX Design", "Research"],
                    description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                    imageUrl: "assets/images/Estación Otemachi_.jpeg",
                  ),
                  _buildCard(
                    title: "Microsoft Dynamics",
                    tags: ["UX Design", "Research"],
                    description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                    imageUrl: "assets/images/Estación Otemachi_.jpeg",
                  ),
                  _buildCard(
                    title: "Microsoft Dynamics",
                    tags: ["UX Design", "Research"],
                    description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                    imageUrl: "assets/images/Estación Otemachi_.jpeg",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required List<String> tags,
    required String description,
    required String imageUrl,
  }) {
    return SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: 500,
                height: 320,
                // Widget de carga mientras la imagen se carga
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: frame != null
                        ? child
                        : Container(
                            width: 500,
                            height: 320,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  );
                },
                // Manejo de errores
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 500,
                    height: 320,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 40, color: Colors.grey[400]),
                        const SizedBox(height: 8),
                        Text(
                          'Image not available',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: tags.map((tag) => _buildTag(tag)).toList(),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text("Read more", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}