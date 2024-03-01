import 'package:flutter/material.dart';
import 'SecondPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Set the desired height
        child: AppBar(
          backgroundColor:
              Colors.transparent, // Set the background color of the app bar
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white, // Starting color (white)
                      Colors.transparent, // Ending color (transparent)
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Todo List',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: const Color.fromARGB(255, 193, 10, 10).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.white), // Set the back button icon
            onPressed: () {
              Navigator.pop(context); // Go back when the icon is pressed
            },
          ),
          actions: [
            Builder(
              builder: (BuildContext context) {
                // Use Builder widget to create a new context
                return IconButton(
                  icon: const Icon(Icons.menu_open_rounded,
                      color: Colors.white), // Set the hamburger icon
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer(); // Open the drawer on icon press
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        elevation: 50.0,
        //backgroundColor: Color.fromRGBO(249, 138, 3, 1),
        surfaceTintColor: Color.fromRGBO(148, 32, 32, 0.941),
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              'images/stickman.jpg',
              width: 300,
              height: 300,
            ),
          ),
          const Text(
            "Task List",
            style: TextStyle(fontSize: 20, fontFamily: 'Open Sans'),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    elevation: 5.0, // Add elevation for shadow effect
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(20.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("U"),
                          Text("UI/UX App"),
                          Text("April-29-2023"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Add spacing between the boxes
                  Material(
                    elevation: 5.0, // No elevation for the next set of texts
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("U"),
                          Text("UI/UX App"),
                          Text("April-29-2023"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Add spacing between the boxes
                  Material(
                    elevation: 5.0, // No elevation for the next set of texts
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("U"),
                          Text("UI/UX App"),
                          Text("April-29-2023"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Add spacing between the boxes
                  Material(
                    elevation: 5.0, // No elevation for the next set of texts
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("U"),
                          Text("UI/UX App"),
                          Text("April-29-2023"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 240, 68, 15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text("Create Task"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(
            247, 61, 15, 1), // Set the color of the selected item
        unselectedItemColor: const Color.fromRGBO(
            247, 61, 15, 1), // Set the color of unselected items
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
