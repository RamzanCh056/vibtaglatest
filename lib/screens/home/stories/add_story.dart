import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_painter/image_painter.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:vibetag/utils/constant.dart';
import '../../../front.dart';

class CreateStroyWithEdit extends StatefulWidget {
   CreateStroyWithEdit(this.imageFile,{Key? key}) : super(key: key);
  String? imageFile;

  @override
  State<CreateStroyWithEdit> createState() => _CreateStroyWithEditState();
}

class _CreateStroyWithEditState extends State<CreateStroyWithEdit> {

  TextEditingController description = TextEditingController();
  bool isLoading = false;
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();



  addStory() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'PHPSESSID=52f80749eeaae71781fc63274702826a; _us=1676443243; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-14%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_story',
      'user_id': loginUserId.toString(),
      'file_type': 'image',
      'description': description.text ?? "",
    });
    //if (widget.imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('image', widget.imageFile.toString()));
   // }


    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("image file ==${widget.imageFile}");
      var message = body["api_status"];
      setState(() {
        isLoading = false;
      });
      if (message == 200) {
        Fluttertoast.showToast(msg: "Your status has been successfully added!");
      }
      else if (message == 400) {
        Fluttertoast.showToast(msg: "Some error please try again letter");
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => FrontPage()));
    }
    else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Some error please try again letter");
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        key: _key,

          body:


          Stack(children: [
            // ImagePainter.file(
            //
            //
            //   widget.imageFile!,
            //   key: _imageKey,
            //   scalable: true,
            //   initialStrokeWidth: 2,
            //   //  textDelegate: DutchTextDelegate(),
            //   initialColor: Colors.green,
            //   initialPaintMode: PaintMode.rect,
            //   height: 800,
            //   width: double.infinity,
            //
            // ),
            Container(
              height: double.infinity,
              width: double.infinity,
              //color: Colors.blue,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //       image:ImagePainter.file(
              //         widget.imageFile!,
              //         key: _imageKey,
              //         scalable: true,
              //         initialStrokeWidth: 2,
              //         //  textDelegate: DutchTextDelegate(),
              //         initialColor: Colors.green,
              //         initialPaintMode: PaintMode.rect,
              //
              //       )as ImageProvider,
              //       // FileImage(
              //       //   widget.imageFile!,
              //       //
              //       // ),
              //       fit: BoxFit.cover
              //
              //   ),
              //
              // ),

            child:  ImagePainter.file(

              height: double.infinity,
              width: double.infinity,
              File(widget.imageFile.toString()),
              key: _imageKey,
              scalable: true,
              initialStrokeWidth: 2,
             // textDelegate: Text("df"),
              //  textDelegate: DutchTextDelegate(),
              initialColor: Colors.green,
              initialPaintMode: PaintMode.line,




            ) ,



            ),

            Positioned.fill(

              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Padding(

                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  //  color: const Color(0xffF5F5F5),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        child: Center(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black38.withOpacity(0.5),
                            child: Icon(Icons.download, color: Colors.white,),
                          )
                        ),
                      ),
                      Expanded(

                        child: const SizedBox(
                          height: 15,
                        ),
                      ),
                      //
                      isLoading?const CircularProgressIndicator():
                      GestureDetector(
                        onTap: (){
                          addStory();
                        },
                        child: Container(
                          height: 49,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffFF9200),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                              Text("Send", style: TextStyle(color: Colors.white),),

                            ],)
                          )
                        ),
                      ),
                      const SizedBox(width: 10,)

                    ],
                  ),

                ),
            ),
              ),),
            Positioned.fill(

              child:  Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Padding(

                    padding: const EdgeInsets.only(top: 65, left: 5),
                    child:CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.black38.withOpacity(0.5),
                      child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
                    )
                  ),
                ),
              ),),

          ],)
      ),
    );
  }
}