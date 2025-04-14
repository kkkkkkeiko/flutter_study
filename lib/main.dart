import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/firebase_options.dart';
import 'package:flutter_study/widget/card_todo_widget.dart';
import 'package:gap/gap.dart';
import 'common/show_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[200],
            radius: 25,
            child: Image.asset('assets/tenshin.png'),
          ),
          title: Text(
            'Hello!',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: Text(
            'Keiko Furuya',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s Task',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Monday, 12 September',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD5E8FA),
                  foregroundColor: Colors.blue.shade800,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed:
                    () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      context: context,
                      builder: (context) => AddNewTaskModel(),
                    ),
                child: const Text('+ New Task'),
              ),
            ],
          ),
          const Gap(20),
          //Card list task
          for (int i = 0; i < 100; i++) CardToDoListWidget(),
        ],
      ),
    );
  }
}
