import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaPicker {
  final ImagePicker picker = ImagePicker();

  Future<List<Map<String, dynamic>>> pickImage() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      final mediaJsonList = <Map<String, dynamic>>[];
      for (var pickedFile in pickedFiles) {
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        final mediaJson = {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'thumbnailFile': File(pickedFile.path).path,
          'mediaType': "image"
        };
        mediaJsonList.add(mediaJson);
      }
      return mediaJsonList;
    } else {
      return [];
    }
  }

  takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(pickedFile.path).path,
        'thumbnailFile': File(pickedFile.path).path,
        'mediaType': "image"
      };
      return mediaJson;
    } else {
      return null;
    }
  }
}
