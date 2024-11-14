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
      backgroundColor: const Color(0xFFF4F3EE),
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
            child: Column(
              children: [
                // Añadido el texto centrado antes de los cards
                const SizedBox(height: 20), 
                const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Hi! I’m ",
                      style: TextStyle(
                        fontFamily: 'Playfair Display',     
                        fontSize: 22, // Tamaño de fuente por defecto
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Pedro Castillo",
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 22, // Aumentado para pantallas grandes
                          ),
                        ),
                        TextSpan(
                          text: ",\nSoftware Engineer based in Panama City",
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            
                            fontSize: 24, // Aumentado para pantallas grandes
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Espacio entre el texto y los cards
                const SizedBox(height: 60), 
                
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildCard(
                      title: "Asamblea Nacional",
                      tags: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF245DFF), // Cambiado el fondo a color #245dff solo para este tag
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "• Work",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(217, 32, 32, 32), // Cambiado el fondo a color #d913e7ff para "Research"
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Cybersecurity Analyst",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                      description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                      imageUrl: "assets/images/work1.jpg",
                    ),

                    _buildCard(
                      title: "Asamblea Nacional",
                      tags: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(217, 219, 19, 245), // Cambiado el fondo a color #245dff solo para este tag
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "• Work placements",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(217, 32, 32, 32), // Cambiado el fondo a color #d913e7ff para "Research"
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Software Engineer Jr.",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                      description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                      imageUrl: "assets/images/work_placements1.jpg",
                    ),

                    _buildCard(
                      title: "Microsoft Dynamics",
                      tags: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF245DFF), // Cambiado el fondo a color #245dff solo para este tag
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "• Work",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        const Text(
                          "Research",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                      description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                      imageUrl: "assets/images/Estación Otemachi_.jpeg",
                    ),

                    _buildCard(
                      title: "Microsoft Dynamics",
                      tags: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF245DFF), // Cambiado el fondo a color #245dff solo para este tag
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "• Work",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        const Text(
                          "Research",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                      description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                      imageUrl: "assets/images/Estación Otemachi_.jpeg",
                    ),

                    _buildCard(
                      title: "Microsoft Dynamics",
                      tags: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF245DFF), // Cambiado el fondo a color #245dff solo para este tag
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "• Work",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        const Text(
                          "Research",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                      description: "Enhancing AI assistance for Customer Support Agents to facilitate faster case resolution",
                      imageUrl: "assets/images/Estación Otemachi_.jpeg",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required List<Widget> tags,
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
            children: tags,
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
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent), // Sin hover transparente
              padding: WidgetStateProperty.all(EdgeInsets.zero), // Sin espaciado de la izquierda
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 2), // Añadido espacio a la izquierda del Row
                ZoomOnHover(
                  child: Text(
                    "Read more",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline, // Subrayado
                    ),
                  ),
                ),
                SizedBox(width: 4), // Espacio entre el texto y el icono
                AnimatedSwitcher( // Añadido para animación
                  duration: Duration(milliseconds: 300),
                  child: Icon(Icons.arrow_outward, color: Colors.black), // Cambiado a icono de flecha apuntando a 45 grados
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomOnHover extends StatefulWidget {
  final Widget child;
  const ZoomOnHover({super.key, required this.child}) : super();

  @override
  ZoomOnHoverState createState() => ZoomOnHoverState();
}

class ZoomOnHoverState extends State<ZoomOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: widget.child,
      ),
    );
  }
}