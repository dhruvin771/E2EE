## End-to-End Encryption (E2EE) using AES

This repository contains code for implementing end-to-end encryption (E2EE) for files using AES (Advanced Encryption Standard) in both Dart and Python.

### Features:
- **AES Encryption:** Uses AES encryption algorithm for secure file encryption.
- **Password Protection:** Encrypts and decrypts files with a user-defined password.
- **Synchronous Operations:** Performs encryption and decryption operations synchronously for simplicity.

### Dart Implementation

#### Usage:
1. Import the `aes_crypt_null_safe` and `open_file_plus` packages.
2. Initialize an `AesCrypt` instance, set a password, and use it to encrypt and decrypt files.
3. Open the decrypted file using `OpenFile.open` method.

#### Example:
```dart
String encryptedFile = await EncryptData.encryptFile(filePath, password);
String decryptedFile = await EncryptData.decryptFile(encryptedFile, password);
```

#### Description:
1. **AES Encryption:** Utilizes AES for file encryption and decryption.
2. **Encryption Method:** Encrypts a file with a specified path and password.
3. **Decryption Method:** Decrypts an encrypted file using the same password.
4. **File Handling:** Prints status messages and opens decrypted files using `OpenFile.open`.

### Python Implementation

#### Usage:
1. Install the `pyAesCrypt` package using `pip install pyAesCrypt`.
2. Use the provided `EncryptData` class to encrypt and decrypt files via command-line arguments.

#### Command-Line Usage:
- **Encrypt a file**:
  ```sh
  python main.py path/to/your/file.txt your-password
  ```

- **Decrypt a file**:
  ```sh
  python main.py path/to/your/file.txt.aes your-password --decrypt
  ```

#### Description:
1. **AES Encryption:** Utilizes AES for file encryption and decryption.
2. **Encryption Method:** Encrypts a file with a specified path and password.
3. **Decryption Method:** Decrypts an encrypted file using the same password.
4. **File Handling:** Prints status messages and provides the decrypted file path.

### Note
Ensure to handle and share passwords securely. Encrypted files are saved in the server directory for secure storage.