import 'package:flutter/material.dart';

void main() {
  runApp(const AdaptiveDashboardApp());
}

class AdaptiveDashboardApp extends StatelessWidget {
  const AdaptiveDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive IoT Dashboard',
      theme: ThemeData(
        // Using a modern olive green and grey color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF556B2F), // Dark Olive Green
          background: Colors.grey[100],
        ),
        useMaterial3: true,
      ),
      home: const ResponsiveLayoutScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoint for landscape/tablet view
        if (constraints.maxWidth >= 600) {
          return Scaffold(
            body: Row(
              children: [
                // Permanent Side Menu in Landscape
                const SizedBox(
                  width: 250,
                  child: NavigationMenu(),
                ),
                // Main Content Area
                Expanded(
                  child: const MainContentArea(),
                ),
              ],
            ),
          );
        } else {
          // Portrait/Mobile view with a Drawer
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
              backgroundColor: const Color(0xFF556B2F),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            drawer: const Drawer(
              child: NavigationMenu(),
            ),
            body: const MainContentArea(),
          );
        }
      },
    );
  }
}

// -----------------------------------------------------------------------------
// REUSABLE COMPONENTS
// -----------------------------------------------------------------------------

/// The Navigation Menu used in both the Drawer (Portrait) and Side Panel (Landscape)
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            alignment: Alignment.bottomLeft,
            height: 120,
            color: Colors.grey[300],
            child: const Text(
              'System Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('ESP Modules'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_input_component),
            title: const Text('Sensors'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

/// The Main Content containing the Header and the List
class MainContentArea extends StatelessWidget {
  const MainContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Responsive Header
        Container(
          width: double.infinity,
          color: const Color(0xFF768B43), // Lighter Olive
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.hub, color: Colors.white, size: 48),
              SizedBox(height: 16),
              Text(
                'Network Status: Online',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'All automated nodes are currently responding.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
        
        // Scrollable List of Items
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: 12,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.developer_board, color: Color(0xFF556B2F)),
                ),
                title: Text(
                  'Hardware Node ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Uptime: 42 hrs • Ping: 12ms'),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}