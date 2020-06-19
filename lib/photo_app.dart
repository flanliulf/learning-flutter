import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 简单案例之拍照 App
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);

    final pickedFile = await picker.getImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
//      _image = File(pickedFile.path);
      _images.add(File(pickedFile.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单案例之拍照 App'),
        // 左边返回按钮
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
//        child: _image == null ? Text('No image selected.') : Image.file(_image),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
   return  _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ],
      );
    }).toList();
  }
}
