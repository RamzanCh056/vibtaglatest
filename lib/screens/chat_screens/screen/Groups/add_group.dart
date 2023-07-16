import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:vibetag/utils/constant.dart';

class AddToGroup extends StatefulWidget {
  AddToGroup({Key ?key}) : super(key: key);

  @override
  _AddToGroupState createState() => _AddToGroupState();
}

class _AddToGroupState extends State<AddToGroup> {
  //static List<usersList> _users = [];



  var newlist;
  bool isLoading = true;
  bool isCreate = false;

  File? imageFile;
  File? profileFile;
  TextEditingController name = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController catagory = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController groupType = TextEditingController();
  TextEditingController description = TextEditingController();

  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  getFromProfie() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        profileFile = File(pickedFile.path);
      });
    }
  }
  var createMessage;
  var error;
      bool isGroupLoading = false;
  createGroup()async{
    setState(() {
      isGroupLoading = true;
    });
    var headers = {
      'Cookie': '_us=1685096920; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-05-25%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_group',
      'user_id': loginUserId,
      'group_name': name.text,
      'group_title': title.text,
      'about': description.text,
      'category': '10',
      'sub_category': '0',
      'privacy': '2',
      'join_privacy': '2'
    });
    request.files.add(await http.MultipartFile.fromPath('cover', imageFile!.path));
    request.files.add(await http.MultipartFile.fromPath('avatar', profileFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body =  jsonDecode(res);
      print(body);
      createMessage = body['api_text'];
      error = body['errors'];
      var message = body['api_status'];
      message =="200" ?
           createMessage:error;
      message =="200" ?
      Fluttertoast.showToast(msg: "${createMessage} created") : Fluttertoast.showToast(msg: "${error}");
    setState(() {
      isGroupLoading = false;
    });
    }


    else {
    print(response.reasonPhrase);
    setState(() {
      isGroupLoading = false;
    });
    }

  }

  @override
  void initState() {
    //getUsers();
    super.initState();
  }


  //List <dynamic>myList = [];
  Set<dynamic> myList = {};
  // bool visibilityStatus() {
  //   for (int i = 0; i < list.length; i++) {
  //     if (list[i].isSelected!) {
  //       return true;
  //
  //     }
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return
      //isLoading ? Center(child: CircularProgressIndicator()):
    SafeArea(
      child: Scaffold(


        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(

            child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 16),),
                          Text("Recommend ratio is 12.9", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),),

                        ],),
                      Expanded(child: SizedBox(width: 0,)),

                      GestureDetector(
                        onTap: (){
                          getFromCamera();
                        },
                        child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffC8D1E5).withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt),
                              SizedBox(width: 5,),
                              Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 12),),
                            ],),
                        ),
                      ),
                      SizedBox(width: 5,),
                    ],),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    //padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: (imageFile != null)
                            ? FileImage(imageFile!) as ImageProvider
                            : const AssetImage(
                          "assets/images/groupc.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.grey.shade50, Colors.grey],
                      ),

                    ),

                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 16),),
                          Text("Recommend ratio is 12.9", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),),

                        ],),
                      Expanded(child: SizedBox(width: 0,)),

                      GestureDetector(
                        onTap: (){
                          getFromProfie();
                        },
                        child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffC8D1E5).withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt),
                              SizedBox(width: 5,),
                              Text("Upload", style: TextStyle(color: Colors.black, fontSize: 12),),
                            ],),
                        ),
                      ),
                      SizedBox(width: 5,),
                    ],),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (profileFile != null)
                            ? FileImage(profileFile!) as ImageProvider
                            : const AssetImage(
                          "assets/images/groupc.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                     // borderRadius: BorderRadius.circular(100),


                    ),

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                        controller: name,
                    decoration: InputDecoration(
                      hintText: 'Enter Group Name',
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 10,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: url,
                    decoration: InputDecoration(
                      hintText: 'Enter Url link',
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 10,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: 'Enter Group title',
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 10,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: catagory,
                    decoration: InputDecoration(
                      hintText: 'Enter Group Catagory',
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 10,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: groupType,
                    decoration: InputDecoration(
                      hintText: 'Enter Group Type',
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        left: 10,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    maxLines: 4,
                    controller: description,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: lightGrayNew,
                        ),
                        borderRadius: borderRadius(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  isGroupLoading ?CircularProgressIndicator():
                  GestureDetector(
                    onTap: (){
                      createGroup();

                      // if(formKey.currentState!.validate()){
                      //   //addBlog();
                      //   createEvent();
                      // }
                    },
                    child: Container(
                     height:43,
                   //   width: width * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: borderRadius(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                ],
              ),
          ),
        ),




      ),
    );
  }
}