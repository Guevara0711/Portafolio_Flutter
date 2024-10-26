import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Ajustamos los breakpoints para que los botones pasen abajo antes de colisionar
    bool isMobile = screenWidth < 768;
    bool isTablet = screenWidth >= 768 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;
    
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal
          Center(
            child: Text(
              'Portafolio',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          
          // Header fijo
          Positioned(
            top: isMobile ? 16 : 16,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Contenedor para logo y links
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? screenWidth * 0.15 : 24, // 15% de padding en cada lado en desktop
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                        // Links derecha
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Resume',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'LinkedIn',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Botones centrales (siempre centrados en la pantalla)
                  if (!isMobile)
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildButton("Work", true),
                            const SizedBox(width: 8),
                            _buildButton("Projects", false),
                            const SizedBox(width: 8),
                            _buildButton("Self", false),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          // Botones para mobile en la parte inferior
          if (isMobile)
            Positioned(
              bottom: 35,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildButton("Work", true),
                      const SizedBox(width: 8),
                      _buildButton("Projects", false),
                      const SizedBox(width: 8),
                      _buildButton("Self", false),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildButton(String text, bool isPrimary) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: isPrimary ? Colors.blue[600] : Colors.grey[800],
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
    onPressed: () {},
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}