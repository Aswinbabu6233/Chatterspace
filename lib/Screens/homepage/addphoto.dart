import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostUploadPage extends StatefulWidget {
  @override
  _PostUploadPageState createState() => _PostUploadPageState();
}

class _PostUploadPageState extends State<PostUploadPage> {
  List<Map<String, dynamic>> _mediaFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null) {
      final mediaJsonList = pickedFiles.map((pickedFile) {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        return {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'thumbnailFile': File(pickedFile.path).path,
          'mediaType': 'image',
        };
      }).toList();

      setState(() {
        _mediaFiles.addAll(mediaJsonList);
      });
    }

    Navigator.pop(context);
  }

  Future<void> takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final thumbnailPath = imageFile.path;

      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': imageFile.path,
        'thumbnailFile': thumbnailPath,
        'mediaType': 'image',
      };

      setState(() {
        _mediaFiles.add(mediaJson);
      });
    }

    Navigator.pop(context);
  }

  void showMediaBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Pick Image'),
              onTap: pickImage,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Picture'),
              onTap: takePicture,
            ),
          ],
        );
      },
    );
  }

  void removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Upload Post',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
            onPressed: () {},
            child: Text(
              "Post",
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Write Something",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: null, // Allows unlimited lines
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      filled: true,
                      fillColor: Color.fromARGB(255, 39, 39, 39),
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _mediaFiles.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: () => showMediaBottomSheet(),
                          ),
                        );
                      }
                      final mediaFile = _mediaFiles[index - 1];
                      final thumbnailFile = File(mediaFile['thumbnailFile']);
                      return InkWell(
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),
                                    onTap: () {
                                      removeMedia(index);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.cancel),
                                    title: Text('Cancel'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Image.file(
                              thumbnailFile,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
