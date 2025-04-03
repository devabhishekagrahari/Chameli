import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Create Questions Easily"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Question'),
              onTap: () => Navigator.pushNamed(context, '/add-question'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('View Questions'),
              onTap: () => Navigator.pushNamed(context, '/view-questions'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Generate Question Paper'),
              onTap: () => Navigator.pushNamed(context, '/view-questions'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('View Question Paper'),
              onTap: () => Navigator.pushNamed(context, '/view-questions'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Let's have the Quiz"),
              onTap: () => Navigator.pushNamed(context, '/view-questions'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Manage Your Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.add,
              text: "Add Question",
              route: '/add-question',
            ),
            _buildButton(
              context,
              icon: Icons.list,
              text: "View Questions",
              route: '/view-questions',
            ),
            _buildButton(
              context,
              icon: Icons.info,
              text: "Generate Question Paper",
              route: '/generate-paper',
            ),
            _buildButton(
              context,
              icon: Icons.shopping_cart,
              text: "View Question Paper",
              route: '/view-paper',
            ),
            _buildButton(
              context,
              icon: Icons.info,
              text: "Let's have the quiz:",
              route: '/quiz',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required IconData icon, required String text, required String route}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Colors.blue.shade900,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
