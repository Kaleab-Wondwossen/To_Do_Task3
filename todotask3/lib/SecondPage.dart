import 'package:flutter/material.dart';
import 'ThirdPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> titles = ["Main Task Name", "Due Date", "Description"];
  List<TextEditingController> controllers = [];
  List<String> inputValues = [];

  Future<void> saveInputsToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the values to SharedPreferences
    prefs.setString('mainTaskName', inputValues[0]);
    prefs.setString('dueDate', inputValues[1]);
    prefs.setString('description', inputValues[2]);
  }

  Future<Map<String, String>> getInputsfromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the values from SharedPreferences
    String? name = prefs.getString('mainTaskName');
    String? date = prefs.getString('dueDate');
    String? description = prefs.getString('description');

    return {
      'mainTaskName': name ?? '',
      'dueDate': date ?? '',
      'description': description ?? '',
    };
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < titles.length; i++) {
      controllers.add(TextEditingController());
      inputValues.add('');
      controllers[i].addListener(() {
        setState(() {
          inputValues[i] = controllers[i].text;
        });
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void saveInputs() {
    // String mainTaskName = inputValues[0];
    // String dueDate = inputValues[1];
    // String description = inputValues[2];
  }

  @override
  Widget build(BuildContext context) {
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
                  'Create a New Task',
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
            //The Expanded widget is used in Flutter to distribute available space within a Column, Row, or Flex widget.
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          titles[index],
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
                          child: TextField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  Map<String, String> inputs =
                      await getInputsfromSharedPreferences();
                  final Logger _logger = Logger();
                  _logger.d('Saved inputs: $inputs');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 184, 9, 9)),
                ),
                child: const Text("Add Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
