import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'encrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'End To End Encryption',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'End To End Encryption'),
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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text('Pick the file'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _pickFile() async {
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.video, allowMultiple: false)
        .then((result) => result?.files.single.path);

    if (filePath != null) {
      setState(() {
        _isLoading = true;
      });

      await EncryptData.encryptFile(filePath);

      setState(() {
        _isLoading = false;
      });
    }
  }
}
