import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        title: Text(
          "Camera",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  elevation: 0,
                  color: Colors.lightBlueAccent,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.black12)
                    ], borderRadius: BorderRadius.circular(100)),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              const Text("Camera",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {}),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                  elevation: 0,
                  color: Colors.lightBlueAccent,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.black12)
                    ], borderRadius: BorderRadius.circular(100)),
                    child: Column(
                      children: [
                        //  Icon(Icons.browse_gallery),
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHfBE8805aJQYtrSgZrLB_rt8PNybC48N_Q&usqp=CAU',
                          scale: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Text("Gallery",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
