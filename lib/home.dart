import 'package:flutter/material.dart';
import 'pages/work.dart';
import 'pages/projects.dart';
import 'pages/self.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  void _changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _getCurrentPage() {
    switch (_currentPage) {
      case 0:
        return const WorkPage();
      case 1:
        return const ProjectsPage();
      case 2:
        return const SelfPage();
      default:
        return const WorkPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 768;
    bool isDesktop = screenWidth >= 1024;
    
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal con scroll
          _getCurrentPage(),
          
          // Header flotante
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: isMobile ? 90 : 90,
              padding: EdgeInsets.only(top: isMobile ? 30 : 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? screenWidth * 0.15 : 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile.jpeg',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                _launchURL('https://utpac-my.sharepoint.com/:b:/g/personal/pedro_castillo3_utp_ac_pa/Edzyr0fisbxEhloKHBoYBWIB8WeEeAd5KdRHLwo3VUQVkQ?e=JzgASp');
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(Colors.transparent),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Resume',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.open_in_new, color: Colors.black),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            TextButton(
                              onPressed: () {
                                _launchURL('https://www.linkedin.com/in/pedro-castillo-guevara/');
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(Colors.transparent),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'LinkedIn',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.open_in_new, color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
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
                            _buildButton("Work", _currentPage == 0, () => _changePage(0)),
                            const SizedBox(width: 8),
                            _buildButton("Projects", _currentPage == 1, () => _changePage(1)),
                            const SizedBox(width: 8),
                            _buildButton("Self", _currentPage == 2, () => _changePage(2)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          // Navegación móvil en la parte inferior
          if (isMobile)
            Positioned(
              bottom: 20,
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
                      _buildButton("Work", _currentPage == 0, () => _changePage(0)),
                      const SizedBox(width: 8),
                      _buildButton("Projects", _currentPage == 1, () => _changePage(1)),
                      const SizedBox(width: 8),
                      _buildButton("Self", _currentPage == 2, () => _changePage(2)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isPrimary, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.blue[600] : Colors.black.withOpacity(0.3),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}