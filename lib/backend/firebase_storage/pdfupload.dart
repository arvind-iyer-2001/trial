import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileUpload {
  final String uid;
  FileUpload(
    this.uid,
  );
  final _databaseReference = FirebaseFirestore.instance;

  Future getPdfAndUpload() async {
    try {
      FilePickerResult filePickerResult = await FilePicker.platform
          .pickFiles(
        type: FileType.any,
        allowedExtensions: [
          'pdf',
        ],
        allowMultiple: false,
      )
          .onError(
        (PlatformException error, stackTrace) {
          throw error.message;
        },
      );
      filePickerResult.files.forEach(
        (element) {
          upload(element);
        },
      );
    } on PlatformException catch (err) {
      throw err.message;
    } finally {}
  }

  Future upload(PlatformFile platformFile) async {
    var dateTime = DateTime.now().toIso8601String();
    var newName = "pdf:$dateTime";
    Reference reference = FirebaseStorage.instance
        .ref(
          platformFile.extension,
        )
        .child(
          newName,
        );
    final metadata = SettableMetadata(
      customMetadata: {
        'size': platformFile.size.toString(),
        'org_file_name': platformFile.name,
      },
      contentType: platformFile.extension,
    );

    final uploadTask = await reference
        .putData(
      platformFile.bytes,
      metadata,
    )
        .onError(
      (PlatformException error, stackTrace) {
        throw error.message;
      },
    );

    String url = await uploadTask.ref.getDownloadURL().onError(
      (PlatformException error, stackTrace) {
        throw error.message;
      },
    );

    await _databaseReference
        .collection("users")
        .doc(uid)
        .collection("docs")
        .doc(newName)
        .set(
      {
        'file_name': platformFile.name,
        'file_path': platformFile.path,
        'file_size': platformFile.size,
        'extension': platformFile.extension,
        'upload_time': dateTime,
        'file_url': url,
      },
    );
  }
}
