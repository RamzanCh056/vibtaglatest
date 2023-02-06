import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/utils/constant.dart';



class CreateNewArticle extends StatefulWidget {
  const CreateNewArticle({Key? key}) : super(key: key);

  @override
  State<CreateNewArticle> createState() => _CreateNewArticleState();
}

class _CreateNewArticleState extends State<CreateNewArticle> {
  final formKey = GlobalKey<FormState>();
  var selectData = [];
  var catagoryId ;
  final Catagory = TextEditingController();
  final title = TextEditingController();
  final contentTitle = TextEditingController();
  final blogDescritpion = TextEditingController();
  final tags = TextEditingController();
  File? imageFile;
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
  bool isLoading = false;
  addBlog() async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': '_us=1672005109; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'blog-operations',
      'sub_type': 'insert-blog',
      'user_id': loginUserId.toString(),
      'blog_title': title.text,
      'blog_description': blogDescritpion.text,
      'blog_content': contentTitle.text,
      'blog_category': catagoryId.toString(),
      'blog_tags': tags.text,
      'user_type': 'user',
      'post_as': '0'
    });
    request.files.add(await http.MultipartFile.fromPath('thumbnail', imageFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message =body['message'];
      Fluttertoast.showToast(msg: message);
      setState(() {
        isLoading = false;
      });
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading = false;
    });
    }

  }



  getBlogCatagories()async{
    var headers = {
      'Cookie': 'PHPSESSID=95a402eb0817b5b960fee05a3fb1001f; _us=1672062940; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-25%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'blog-operations',
      'sub_type': 'get-blogs-categories'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      selectData = body['categories'];
    }
    else {
    print(response.reasonPhrase);
    }

  }
  showDialogForCatagory() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select catagory'),
            content:Container(
              height: 540,
              child: FutureBuilder(
                  future:  getBlogCatagories(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || selectData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: selectData.length,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                      child:
                                      Text(  selectData[index]['name'].toString(),
                                      )
                                  ),
                                  const Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                Catagory.text =  selectData[index]['name'].toString();
                                catagoryId = selectData[index]['id'].toString();
                                // print("i am current label  ${  Catagory.text}");
                                // print("i am current id  ${  catagoryId}");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                      child: const Center(child:  Icon(Icons.article, color: Colors.white, size: 18,)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Create new article"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Title here',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintStyle: const TextStyle(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: blogDescritpion,
                        maxLines: 6,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Write here',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            hintStyle: const TextStyle(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                    ),
                    const Text(
                      "Content",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFE8E8E8),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "File",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "Edit",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "Insert",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "View",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "Format",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "Tables",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                                Text(
                                  "Tools",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/Path 437.svg'),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset('assets/Path 438.svg'),
                                const SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                const Text(
                                  "Format",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                ),
                                const SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                const Icon(
                                  Icons.format_bold,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.format_italic,
                                  size: 25,
                                ),
                                const SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                SvgPicture.asset('assets/Group 1518.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/Group 1519.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/Group 1520.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/Group 1521.svg'),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/Group 1522.svg'),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset('assets/Group 1523.svg'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                          Container(
                            child: TextFormField(
                              controller: contentTitle,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFEFEFEF),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                Text(
                                  "P",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Text(
                                  "Words: 0",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Thumbnail",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        getFromCamera();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: (imageFile != null)
                                  ? FileImage(imageFile!) as ImageProvider
                                  : const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e2w7sqLN7wNvah3rnc3RbSILIsG7Bfdwa7haC-mEzRmj8bqeseg0241dzcF1W4yGkoU&usqp=CAU",
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [

                            Text(
                              'Drop Image Here or Browse to upload',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        showDialogForCatagory();
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: Catagory,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: 'Category',
                            filled: true,
                            enabled: false,
                            suffixIcon: Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEFEFEF),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10)),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: const Icon(Icons.arrow_drop_up),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEFEFEF),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10)),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: const Icon(Icons.arrow_drop_up),
                                  ),
                                ],
                              ),
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tags",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(),
                      child: TextFormField(
                        controller: tags,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: 'Tags here',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        const Text(
                          "Go Back",
                          style: TextStyle(color: Colors.blue),
                        ),
                        const Spacer(),
                        isLoading? const CircularProgressIndicator():
                        MaterialButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              addBlog();
                            }
                          },
                          color: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Publish",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                color: const Color(0xFFFF9200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Market Place\nTerms",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Your\nWishlist",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Refund\nPolicy",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "On Sale\nItems",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Start\nSelling",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Find Help &\nSupport",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text("C 2022 VibeTag"),
                    Spacer(),
                    Text("C 2022 VibeTag"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
