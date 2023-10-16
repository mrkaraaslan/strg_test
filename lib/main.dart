import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strg_test/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UploadTask? task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();

                  // Pick a video.
                  final XFile? vid =
                      await picker.pickVideo(source: ImageSource.gallery);
                  if (vid == null) return;

                  String fileExtension = vid.path.split(".").last;

                  // Load file to database
                  final ref = FirebaseStorage.instance.ref("media/").child(
                      "${DateTime.now().toIso8601String()}.$fileExtension");
                  setState(() {
                    task = ref.putFile(File(vid.path));
                  });

                  task?.snapshotEvents.listen((TaskSnapshot snap) async {
                    switch (snap.state) {
                      case TaskState.running:
                        print("${snap.bytesTransferred}/${snap.totalBytes}");
                        break;
                      case TaskState.success:
                        setState(() {
                          task = null;
                        });
                        final downloadUrl = await ref.getDownloadURL();
                        print("success: $downloadUrl");
                        break;
                      case TaskState.error:
                        print("error");
                        break;
                      case TaskState.canceled:
                        print("canceled");
                        break;
                      case TaskState.paused:
                        print("paused");
                        break;
                    }
                  }, onError: (err) {
                    print("the error $err");
                  });
                },
                child: const Text("Select and Upload Video '.putFile'")),
            ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();

                  // Pick a video.
                  final XFile? vid =
                      await picker.pickVideo(source: ImageSource.gallery);
                  if (vid == null) return;

                  String fileExtension = vid.path.split(".").last;

                  // Load file to database
                  final ref = FirebaseStorage.instance.ref("media/").child(
                      "${DateTime.now().toIso8601String()}.$fileExtension");
                  final asData = await vid.readAsBytes();
                  setState(() {
                    task = ref.putData(asData);
                  });

                  task?.snapshotEvents.listen((TaskSnapshot snap) async {
                    switch (snap.state) {
                      case TaskState.running:
                        print("${snap.bytesTransferred}/${snap.totalBytes}");
                        break;
                      case TaskState.success:
                        setState(() {
                          task = null;
                        });
                        final downloadUrl = await ref.getDownloadURL();
                        print("success: $downloadUrl");
                        break;
                      case TaskState.error:
                        print("error");
                        break;
                      case TaskState.canceled:
                        print("canceled");
                        break;
                      case TaskState.paused:
                        print("paused");
                        break;
                    }
                  }, onError: (err) {
                    print("the error $err");
                  });
                },
                child: const Text("Select and Upload Video '.putData'")),
            ElevatedButton(
                onPressed: () async {
                  final res = await task?.cancel();
                  print("canceled by user: $res");

                  if (res != null && res) task = null;
                },
                child: const Text("Cancel")),
          ],
        ),
      ),
    );
  }
}
