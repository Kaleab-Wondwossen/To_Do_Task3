import 'package:flutter/material.dart';
import 'SecondPage.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    List tiltes = ["Title", "Description", "Dead Line"];

    String extractTaskName(String inputs) {
      List<String> inputList = inputs.split(',');
      String taskName = inputList.isNotEmpty ? inputList[0] : '';
      return taskName;
    }

    String extractDueDate(String inputs) {
      List<String> inputList = inputs.split(',');
      String dueDate = inputList.length > 1 ? inputList[1] : '';
      return dueDate;
    }

    String extractDescription(String inputs) {
      List<String> inputList = inputs.split(',');
      String description = inputList.length > 2 ? inputList[2] : '';
      return description;
    }
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent Scaffold from resizing when the keyboard appears
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
                  'Task Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: const Color.fromARGB(255, 193, 10, 10)
                            .withOpacity(0.5),
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
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/stickman.jpg',
              width: 300,
              height: 300,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: tiltes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              tiltes[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 195, 21, 8),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Text(
                                'here'
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
