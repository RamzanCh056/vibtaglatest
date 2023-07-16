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

List<String>  images = [
  "assets/icons/image 99.png",
  "assets/icons/image 100.png",
  "assets/icons/image 101.png",
  "assets/icons/image 93.png",
  "assets/icons/image 94.png",
  "assets/icons/image 95.png",
  "assets/icons/image 96.png",
  "assets/icons/image 97.png",
  "assets/icons/image 102.png",
  "assets/icons/image 98.png",
  "assets/icons/image 103.png",
  "assets/icons/image 104.png",
  "assets/icons/image 105.png",
  "assets/icons/image 106.png",
  "assets/icons/image 107.png",
];
  var file;
  addStory() async {

    final Uint8List? imageBytes = await _imageKey.currentState!.exportImage();

    if (imageBytes != null) {
      final List<int> bytes = imageBytes.toList();

      final directory = await getApplicationDocumentsDirectory();
       file = File('${directory.path}/my_image.png');
      await file.writeAsBytes(bytes);

      print('Image saved to ${file.path}');
    } else {
      print('Error exporting the image.');
    }

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
      request.files.add(await http.MultipartFile.fromPath('image',file.path.toString()
          //widget.imageFile.toString()
      )
     );
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

  void saveImage() async {
    final image = await _imageKey.currentState!.exportImage();
  //  final imagef = await _imageKey.currentState!.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('${fullPath}');
    imgFile.writeAsBytesSync(image!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[700],
        padding: const EdgeInsets.only(left: 10),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Image Exported successfully.",
                style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: () {
                print("path = ${fullPath}");
                print("path = ${widget.imageFile}");

              },
              //=> OpenFile.open("$fullPath"),
              child: Text(
                "Open",
                style: TextStyle(
                  color: Colors.blue[200],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        key: _key,

          body:


          Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            child:  ImagePainter.file(

              height: double.infinity,
              width: double.infinity,
              File(widget.imageFile.toString()),
              key: _imageKey,
              scalable: true,
              initialStrokeWidth: 2,
              initialColor: Colors.green,
              initialPaintMode: PaintMode.line,
            ) ,



            ),

            Positioned.fill(

              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Padding(

                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: saveImage,
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
            ),
              ),),
            Positioned.fill(

              child:  Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap:(){
                    showSticker();
                  //  Navigator.pop(context);
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
  showSticker(){
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (ctx) {
          return Container(
            //color: Colors.grey[600],
              padding: EdgeInsets.all(15),
              child: FractionallySizedBox(
                heightFactor: 0.92,
                child: Column(
                  children: [
                    //Icon and Read by
                    Row(
                      children: [
                        InkWell(
                          onTap: (){

                            // Navigator.pop(context);
                            // initState();
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF1F1F1)),
                            child: Icon(Icons.keyboard_arrow_down_sharp),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),

                        Text(
                          "Sticker",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )

                      ],
                    ),



                    SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
          itemCount:15,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          //gifData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 4.0,
          // mainAxisSpacing: 4.0
          ),
          itemBuilder: (context, index){

          return InkWell(
          child: Column(
          children: [
          Container(
          height: 80.0,
          child:

          Image.asset(
            images[index],
          width: 75,

          fit: BoxFit.cover,
          ),
          ),
          ],
          ),
          onTap: () {
          // stickerUrl =stickerData[index];
          // print("gif Link is $stickerUrl");
          // sendMessage();
          // Future.delayed(const Duration(seconds: 3), () {
          //  Navigator.pop(context);
          // });
          //Navigator.pop(context);
          //    initState();
          setState(() {});
          },
          );
          }

          ),



                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ));
        });

  }
}