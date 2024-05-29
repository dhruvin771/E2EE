import 'package:end2end_encryption/rsa.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'aes.dart';
import 'fast_rsa/fast_rsa.dart';

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
  String? _rsaPrivateKey;
  String? _rsaPublicKey;

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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pick a file to encrypt'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: const Text('Pick File'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _generateRSAKeys,
                    child: const Text('Generate RSA Keys'),
                  ),
                  const SizedBox(height: 20),
                  if (_rsaPrivateKey != null && _rsaPublicKey != null) ...[
                    const Text('RSA Private Key:'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _rsaPrivateKey!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('RSA Public Key:'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _rsaPublicKey!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
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

      await EncryptData.encryptFile(filePath, "test@123");

      setState(() {
        _isLoading = false;
      });
    }
  }

  void _generateRSAKeys() async {
    setState(() {
      _isLoading = true;
    });

    try {
      KeyPair keyPair = await RSAKeyGenerator.generateKeyPair();
      setState(() {
        _rsaPrivateKey = keyPair.privateKey;
        _rsaPublicKey = keyPair.publicKey;
      });
    } catch (e) {
      print('Error generating RSA keys: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
