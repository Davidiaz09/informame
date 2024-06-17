import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class WriteArticle extends StatefulWidget {
  const WriteArticle({Key? key}) : super(key: key);

  @override
  _WriteArticleState createState() => _WriteArticleState();
}

class _WriteArticleState extends State<WriteArticle> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  TextEditingController articleName = TextEditingController(text: '');
  TextEditingController authorName = TextEditingController(text: '');
  TextEditingController articleContent = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: const Text('Write Article'),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: articleName,
              decoration: const InputDecoration(
                labelText: 'Article Name',
                border: OutlineInputBorder(),
              ), 
              maxLines: 1,
            ),
            SizedBox(height: 20.0),

            TextField(
              controller: authorName,
              decoration: const InputDecoration(
                labelText: 'Author',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 30.0),

            GestureDetector(
              onTap: _pickImage,
              child: _image == null
                  ? ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: 30.0),
                      child: ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: Icon(Icons.add_photo_alternate),
                        label: Text('Article Thumbnail'),
                      ),
                    )
                  : Image.file(
                      _image!,
                      height: 100,
                    ),
            ),
            SizedBox(height: 30.0),

            TextField(
              controller: articleContent,
              decoration: const InputDecoration(
                labelText: 'Article Content',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0), 
                isCollapsed: true, 
                alignLabelWithHint: true,
              ),
              maxLines: 12, 
              textAlign: TextAlign.left, 
              textAlignVertical: TextAlignVertical.top, 
            ),
            SizedBox(height: 30.0), 

            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  // Lógica para publicar el artículo
                },
                icon: Icon(Icons.publish),
                label: Text('Publish'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
