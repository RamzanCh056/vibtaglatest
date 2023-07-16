import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
import '../../utils/constant.dart';
import '../../widgets/navbar.dart';
import '../header/header.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  int groupValue = 1;
  var productValue;
  var pages =[];
  var productColor =[];
  final pageController = TextEditingController();
  final retuenableController = TextEditingController();
  final deliveryCostController = TextEditingController();
  final deliveryTypeController = TextEditingController();
  final nameController = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final salePrice = TextEditingController();
  final aditionalInformation = TextEditingController();
  final productCatagory = TextEditingController ();
  final modelNumber = TextEditingController ();
  final brandName = TextEditingController ();
  final amountStack = TextEditingController ();
  final productConditoin = TextEditingController ();
  final rangeOne = TextEditingController ();
  final rangeTwo = TextEditingController ();
  final priceBulk = TextEditingController ();
  final sizeBulk = TextEditingController ();
  final colorName = TextEditingController ();
  var colorUrl;
  String? docName;
  String? docPath;
  PlatformFile? file;
  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,


      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );
    if (result == null) return;
    file = result.files.first;
    //   final path = result.files.single.path!;
    print(file!.name);
    print(file!.path);

    setState(() {
      docName = file!.name;
      docPath = file!.path;


    });
  }

  var conditoinId;
 var deliveryCostValue ;
  bool _isShowColor = false;
  File? imageFile;
  var selectData = [];
  var catagoryId;
bool isLoading = false;
  double? longitude;
  double? latitude;
  final location = TextEditingController();
  LatLng addressLatLng = const LatLng(31.5204, 74.3587);
  showPlacePicker() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            apiKey: Platform.isAndroid
                ? 'AIzaSyC-DzQ5xVOl3ZPBMJ1ags_AczrUHFMEVMU'
                : "AIzaSyC-DzQ5xVOl3ZPBMJ1ags_AczrUHFMEVMU",
            hintText: "Select Location",
            searchingText: "Please wait ...",
            selectText: "Select place",
            outsideOfPickAreaText: "Place is not in area",
            initialPosition: addressLatLng,
            selectInitialPosition: true,
            onPlacePicked: (result) {
              location.text = result.formattedAddress!;
              addressLatLng = LatLng(
                  result.geometry!.location.lat, result.geometry!.location.lng);
              latitude = result.geometry!.location.lat;
              longitude = result.geometry!.location.lng;

              Navigator.of(context).pop();
              setState(() {});
            },
          );
        },
      ),
    );
    setState(() {});
  }
  createProduct()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'PHPSESSID=4060084189d798583d37d974880af2e7; _us=1681026035; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_product_simple',
      'user_id': loginUserId.toString(),
      'user_type': 'page',
      'post_as': pageId.toString(),
      'name': 'Test Project',
      'description': description.text,
      'additional_desc':aditionalInformation.text,
      'category': catagoryId.toString(),
      'product_sub_category': '',
      'sub_type': '',
      'sub_sub_sub_type': '',
      'product_type': '1',
      'price': price.text,
      'sale_price': salePrice.text,
      'delivery_type': deliveryTypeController.text,
      'variant_type[]': deliveryTypeController.text,
      'delivery_price[]': '0',
      'estimated_day[]': '8 - 12 Days',
      'variant_type[]': 'Standard Delivery',
      'delivery_price[]': '10',
      'estimated_day[]': '2 - 5 Days',
      'model_number': modelNumber.text,
      'amount_stock': amountStack.text,
      'currency': '0',
      'returnable': retuenableController.text,
      'single_delivery_cost_for_multiple': deliveryCostValue.toString(),
      'location': '',
      'lat': '',
      'lng': '',
      'product_condition': conditoinId.toString(),
    });
    request.files.add(await http.MultipartFile.fromPath('postPhotos[]', imageFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      if (body['errors'] != null) {
        var errorText = body['errors'][0];
        Fluttertoast.showToast(msg: "$errorText");
        print("i am Error text $errorText");
        setState(() {
          isLoading = false;
        });
      } else {
        var message = body['message'];
        print("i am new success $message");
        Fluttertoast.showToast(msg: "${message} created ${message}");

        // Get.to(const MyPageHomeScreen());
        setState(() {
          isLoading = false;
        });
      }
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading = false;
    });
    }

  }
  getProductCatagory()async{
    var headers = {
      'Cookie': 'PHPSESSID=4060084189d798583d37d974880af2e7; _us=1681032569; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'user_id': loginUserId.toString(),
      'type': 'get_product_categories',
      'get_main_categories': '',
      'get_sub_categories_from_cate_id': '',
      'get_sub_sub_categories_from_sub_id': '',
      'get_sub_sub_sub_categories_from_sub_sub_id': '10'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      selectData = body;
    }
    else {
    print(response.reasonPhrase);
    }

  }
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
  createBulkProduct()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'PHPSESSID=d8d0ostbd74b8so0bf518rp39k; _us=1681291732; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-11%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_product_bulk',
      'user_id':  loginUserId.toString(),
      'user_type': 'page',
      'post_as':  pageId.toString(),
      'name': 'Test Project', //
      'description': description.text,
      'additional_desc':aditionalInformation.text,
      'category': catagoryId.toString(),
      'product_sub_category': '',
      'sub_type': '',
      'sub_sub_sub_type': '',
      'product_type': '3',
      'price': price.text,
      'sale_price': salePrice.text,
      'delivery_type': deliveryTypeController.text,
      'variant_type[]': deliveryTypeController.text,
      'delivery_price[]': '0',
      'estimated_day[]': '8 - 12 Days',
      'variant_type[]': 'Standard Delivery',
      'delivery_price[]': '10',
      'estimated_day[]': '2 - 5 Days',
      'model_number': modelNumber.text,
      'amount_stock': amountStack.text,
      'currency': '0',
      'returnable': retuenableController.text,
      'single_delivery_cost_for_multiple': deliveryCostValue.toString(),
      'location': location.text,
      'lat_': latitude.toString(),
      'lng': longitude.toString(),
      'color': colorUrl.toString(),
      'variant_color[]': colorName.text,
     // 'variant_color[]': 'Baby Pink',
      'size': sizeBulk.text,
      'range1[]': rangeOne.text,
      'range2[]': rangeTwo.text,
      'price_bulk[]': priceBulk.text,
    });
    request.files.add(await http.MultipartFile.fromPath('postPhotos[]',imageFile!.path));
    request.files.add(await http.MultipartFile.fromPath('variant_color_image[]' , docPath.toString(), ));
   // request.files.add(await http.MultipartFile.fromPath('variant_color_image[]', 'product-3.jpg'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      if (body['errors'] != null) {
        var errorText = body['errors'][0];
        Fluttertoast.showToast(msg: "$errorText");
        print("i am Error text $errorText");
        setState(() {
          isLoading = false;
        });
      } else {
        var message = body['message'];
        print("i am new success $message");
        Fluttertoast.showToast(msg: "${message} created ${message}");

        // Get.to(const MyPageHomeScreen());
        setState(() {
          isLoading = false;
        });
      }
    }
    else {
      setState(() {
        isLoading = false;
      });
    print(response.reasonPhrase);
    }

  }
  List<String> retuenableList =[
    'yes',
    'no',
  ];
  List<String> deliveryTypeList =[
    'Free delivery',
    'Standard delivery',
    'Express delivery',
    'Pick Up seller location',
  ];
  List<String> condition =[
    'New',
    'Used',
  ];
  List<String> deliveryCostList =[
    'yes',
    'no',
  ];
  var pageId;
  myPages()async{
    var headers = {
      'Cookie': 'PHPSESSID=4060084189d798583d37d974880af2e7; _us=1681027004; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_pages',
      'sub_type': 'my_pages',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      pages = body['data'];
      setState(() {
        pages;
      });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  getColorProducts()async{
    var headers = {
      'Cookie': 'PHPSESSID=d8d0ostbd74b8so0bf518rp39k; _us=1681291732; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-11%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'store',
      'sub_type': 'get_product_colors'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   //   print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      productColor = body['data'];
      setState(() {
        productColor;
      });
    }
    else {
    print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    getColorProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            Header(
            ),
            const SizedBox(
              height: 10,
            ),
     Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(children: [
           Center(
             child: Text(
               "Sell new product",
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
           ),
           SizedBox(
             height: 20,
           ),
           // selected product type
           Container(
             padding: EdgeInsets.all(10),
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   "Select Product Type",
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 RadioListTile<int>(
                   value: 1,
                   groupValue: groupValue,
                   onChanged: (value) {
                     setState(() {
                       groupValue = value!;

                       productValue = "SIMPLE PRODUCT";
                       print(productValue);

                     });
                   },
                   title: Text(
                     "SIMPLE PRODUCT",
                     style:
                     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                   ),
                 ),
                 RadioListTile<int>(
                   value: 2,
                   groupValue: groupValue,
                   onChanged: (value) {
                     setState(() {
                       groupValue = value!;
                       productValue = "VARIANT PRODUCT";
                       print(productValue);
                     });
                   },
                   title: Text(
                     "VARIANT PRODUCT (Size + Color)",
                     style:
                     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                   ),
                 ),
                 RadioListTile<int>(
                   value: 3,
                   groupValue: groupValue,
                   onChanged: (value) {
                     setState(() {
                       groupValue = value!;
                       productValue = "PRODUCT WITH ONLY COLOUR";
                       print(productValue);
                     });
                   },
                   title: Text(
                     "PRODUCT WITH ONLY COLOUR",
                     style:
                     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                   ),
                 ),
                 RadioListTile<int>(
                   value: 4,
                   groupValue: groupValue,
                   onChanged: (value) {
                     setState(() {
                       groupValue = value!;
                       productValue = "BULK SALE DISCOUNT";
                       print(productValue);
                     });
                   },
                   title: Text(
                     "BULK SALE DISCOUNT (M.O.Q)",
                     style:
                     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Container(
             padding: EdgeInsets.all(10),
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 20,
                 ),
                 Text("Name"),
                 SizedBox(
                   height: 10,
                 ),
                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: nameController,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: Color(0xFFEFEFEF),
                       hintText: "Name",
                       contentPadding: EdgeInsets.only(left: 10),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide.none,
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide.none,
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text("Description"),
                 SizedBox(
                   height: 10,
                 ),
                 TextField(
                   maxLines: 6,
                   controller: description,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Color(0xFFEFEFEF),
                     hintText: "Please describe your product",
                     contentPadding: EdgeInsets.all(20),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide.none,
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide.none,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 const Text(
                   "Aditional information",
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
                           controller: aditionalInformation,
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
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Container(
             padding: EdgeInsets.all(10),
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Text("Price"),
                 SizedBox(
                   height: 10,
                 ),
                 SizedBox(
                   height: 40,
                   child: TextField(
                        controller: price,
                     decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         hintText: '0.00',
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text("Sale Price"),
                 SizedBox(
                   height: 10,
                 ),
                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: salePrice,
                     decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         hintText: '0.00',
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(
                   "Leave empty if not on sale.",
                   style: TextStyle(fontWeight: FontWeight.w400),
                 )
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),

           Container(
             padding: EdgeInsets.all(10),
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Text("Location"),
                 SizedBox(
                   height: 10,
                 ),
                 SizedBox(
                   height: 40,
                   child: GestureDetector(
                     onTap: (){
                       showPlacePicker();
                     },
                     child: TextField(
                       enabled: false,
                       controller: location,
                       decoration: InputDecoration(
                           filled: true,
                           fillColor: Color(0xFFEFEFEF),
                           hintText: 'Enter a location',
                           contentPadding: EdgeInsets.only(left: 10),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide.none,
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide.none,
                           )),
                     ),
                   ),
                 ),
                 // SizedBox(
                 //   height: 20,
                 // ),
               //  Text("Sale Price"),
               //   SizedBox(
               //     height: 10,
               //   ),
               //   Container(
               //     height: 40,
               //     decoration: BoxDecoration(
               //       color: Color(0xFFEFEFEF),
               //       borderRadius: BorderRadius.circular(10),
               //     ),
               //     child: Row(
               //       children: [
               //         Expanded(
               //           child: TextField(
               //             decoration: InputDecoration(
               //                 contentPadding: EdgeInsets.only(left: 10),
               //                 border: OutlineInputBorder(
               //                   borderRadius: BorderRadius.circular(10),
               //                   borderSide: BorderSide.none,
               //                 ),
               //                 focusedBorder: OutlineInputBorder(
               //                   borderRadius: BorderRadius.circular(10),
               //                   borderSide: BorderSide.none,
               //                 )),
               //           ),
               //         ),
               //         Column(
               //           children: [
               //             Container(
               //               height: 20,
               //               width: 26,
               //               decoration: BoxDecoration(
               //                 borderRadius: BorderRadius.only(
               //                   topRight: Radius.circular(10),
               //                 ),
               //                 border: Border.all(color: Colors.grey),
               //               ),
               //               child: Center(
               //                 child: Icon(Icons.keyboard_arrow_up),
               //               ),
               //             ),
               //             Container(
               //               height: 20,
               //               width: 26,
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.only(
               //                     bottomRight: Radius.circular(10),
               //                   ),
               //                   border: Border.all(color: Colors.grey)),
               //               child: Center(
               //                 child: Icon(Icons.keyboard_arrow_down),
               //               ),
               //             ),
               //           ],
               //         )
               //       ],
               //     ),
               //   ),
                 SizedBox(
                   height: 20,
                 ),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             width: double.infinity,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   "Other Photos",
                   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 GestureDetector(
                   onTap: (){
                     getFromCamera();
                   },
                   child: Container(
                     height: 100,
                     width: 100,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: (imageFile != null)
                             ? FileImage(imageFile!) as ImageProvider
                             : const NetworkImage(
                           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e2w7sqLN7wNvah3rnc3RbSILIsG7Bfdwa7haC-mEzRmj8bqeseg0241dzcF1W4yGkoU&usqp=CAU",
                         ),
                         fit: BoxFit.cover,
                       ),
                       color: Color(0xFFEFEFEF),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Icon(
                       Icons.photo_size_select_actual_outlined,
                       color: Colors.grey,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(
                     "Select all your images at once, Images can be added in product edit page.")
               ],
             ),
           ),
           SizedBox(
             height: 30,
           ),
           Text(
             "Product Category",
             style: TextStyle(fontSize: 17),
           ),
           SizedBox(
             height: 10,
           ),
           Container(
             padding: EdgeInsets.all(10),
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white, borderRadius: BorderRadius.circular(10)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Text("Category"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: GestureDetector(
                   onTap: (){
                 showDialogForProductCatagory();
                 },
                           child: TextField(
                             controller: productCatagory,
                             enabled: false,
                             decoration: InputDecoration(
                                 hintText: "Select",
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 )),
                           ),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text(" Sub Sub Category"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                               hintText: "Select",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text("Sub Category"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                               hintText: "Select",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text("Sub Sub Sub Category"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                               hintText: "Select",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Type of condition"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                          // controller: rangeOne,
                           decoration: InputDecoration(
                               hintText: "type of used",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),

                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller:modelNumber ,
                     decoration: InputDecoration(
                         hintText: "add model number",
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: brandName ,
                     decoration: InputDecoration(
                         hintText: "Brand",
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: amountStack ,
                     decoration: InputDecoration(
                         hintText: "Amount of stock",
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

               ],
             ),
           ),

           SizedBox(
             height: 20,
           ),
           // Retuenable
           productValue == "BULK SALE DISCOUNT" ?
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Bulk Discount"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           controller: rangeOne,
                           decoration: InputDecoration(
                               hintText: "range one",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),

                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller:rangeTwo ,
                     decoration: InputDecoration(
                         hintText: "range 2",
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),

                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: priceBulk ,
                     decoration: InputDecoration(
                         hintText: "price",
                         filled: true,
                         fillColor: Color(0xFFEFEFEF),
                         contentPadding: EdgeInsets.only(left: 10),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide.none,
                         )),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                
               ],
             ),
           ) : Container(),
           SizedBox(
             height: 20,
           ),
           productValue == "BULK SALE DISCOUNT" ?
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child:Column(
               children: [
                 Text("Size and Colors"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           controller: sizeBulk,
                           decoration: InputDecoration(
                               hintText: "Size",
                               contentPadding: EdgeInsets.only(left: 10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none,
                               )),
                         ),
                       ),

                     ],
                   ),
                 ),


                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             setState(() {
                               _isShowColor =
                               !_isShowColor;
                             });
                           },
                           child: TextField(
                             controller: colorName,
                             enabled: false,
                             decoration: InputDecoration(
                                 hintText: "Colors",
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 )),
                           ),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),

                 Visibility(
                   visible: _isShowColor,
                   child: SizedBox(
                     height: 100,
                     child: ListView.builder(
                         itemCount:
                         productColor.length,
                         shrinkWrap: true,
                         scrollDirection:
                         Axis.horizontal,
                         itemBuilder:
                             (context, index) {
                           return GestureDetector(
                             onTap: (){
                               colorName.text =
                                   productColor[index]['name'].toString();
                               colorUrl =
                                   productColor[index]['url'].toString();
                               _isShowColor =
                               !_isShowColor;
                               setState(() {});
                             },
                             child: Padding(

                               padding:
                               const EdgeInsets.all(
                                   1.0),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(children: [
                                     Container(
                                     // margin: EdgeInsets.symmetric(vertical: 5),
                                     height: 50,
                                     width: 50,
                                     decoration:
                                     BoxDecoration(
                                       borderRadius:
                                       BorderRadius
                                           .circular(
                                           70),

                                     ),
                                     child:
                                          ClipRRect(
                                         borderRadius:
                                         BorderRadius.circular(
                                             70),
                                         child: Image
                                             .network(
                                           productColor[index]['url'],
                                           fit: BoxFit
                                               .cover,
                                         ))
                                        ),
                                   SizedBox(height: 10,),
                                   Text(productColor[index]['name'],),
                                 ],),
                               )
                             ),
                           );
                         }),
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 colorName.text!=null && colorName.text!=""?

                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(colorName.text),
                     SizedBox(height: 10,),
                     GestureDetector(
                       onTap: (){
                         selectFile();
                       },
                       child: Container(
                         height: 50,
                         width: 100,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                           color: Colors.grey.shade400,
                         ),
                         child: Center(child: Text("chose image")),
                       ),
                     ),
                   ],
                 ):Container(),
                 SizedBox(height: 10,),
                 docPath !="" &&  docPath !=null? Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: const Color(0xffFF9200),
                     ),
                     height: 50,
                     child: Row(
                       children: [
                         const Icon(
                           Icons.file_copy_rounded,
                           color: Colors.white,
                         ),
                         SizedBox(width: 5,),
                         Expanded(
                             child: Text(
                               docName.toString(),
                               style: const TextStyle(
                                   color: Colors.white, fontWeight: FontWeight.w400),
                             )),
                       ],
                     )) :Container(),
               ],
             ),
           ) : Container(),
           SizedBox(
             height: 20,
           ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Retuenable"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             showDialogForRetuenable();
                           },
                           child: TextField(
                             controller: retuenableController,
                             enabled: false,
                             decoration: InputDecoration(
                                 hintText: "select",
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 )),
                           ),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text("Same Delivery Cost"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             showDialogForDeliveryCost();
                           },
                           child: TextField(
                             controller: deliveryCostController,
                             enabled: false,
                             decoration: InputDecoration(
                                 hintText: "select",
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 )),
                           ),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text("Same Delivery Cost for More then 1 Product"),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
        
           // Post as
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Post as"),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: 40,
                   decoration: BoxDecoration(
                     color: Color(0xFFEFEFEF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             showDialogForMyPages();
                           },
                           child: TextField(
                             controller: pageController,
                             decoration: InputDecoration(
                                 hintText: "Haritlw - Page",
                                 enabled: false,
                                 contentPadding: EdgeInsets.only(left: 10),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide.none,
                                 )),
                           ),
                         ),
                       ),
                       Column(
                         children: [
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(10),
                               ),
                               border: Border.all(color: Colors.grey),
                             ),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_up),
                             ),
                           ),
                           Container(
                             height: 20,
                             width: 26,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(10),
                                 ),
                                 border: Border.all(color: Colors.grey)),
                             child: Center(
                               child: Icon(Icons.keyboard_arrow_down),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Delivery type"),
                       SizedBox(
                         height: 10,
                       ),
                       Container(
                         height: 40,
                         decoration: BoxDecoration(
                           color: Color(0xFFEFEFEF),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){
                                   showDialogForDeliveryType();
                                 },
                                 child: TextField(
                                   controller: deliveryTypeController,
                                   decoration: InputDecoration(
                                       hintText: "Delivery type",
                                       enabled: false,
                                       contentPadding: EdgeInsets.only(left: 10),
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10),
                                         borderSide: BorderSide.none,
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10),
                                         borderSide: BorderSide.none,
                                       )),
                                 ),
                               ),
                             ),
                             Column(
                               children: [
                                 Container(
                                   height: 20,
                                   width: 26,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(10),
                                     ),
                                     border: Border.all(color: Colors.grey),
                                   ),
                                   child: Center(
                                     child: Icon(Icons.keyboard_arrow_up),
                                   ),
                                 ),
                                 Container(
                                   height: 20,
                                   width: 26,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         bottomRight: Radius.circular(10),
                                       ),
                                       border: Border.all(color: Colors.grey)),
                                   child: Center(
                                     child: Icon(Icons.keyboard_arrow_down),
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
                 SizedBox(
                   height: 60,
                 ),
                 Center(
                   child:
                   isLoading? Center(child: CircularProgressIndicator()):
                   GestureDetector(
                     onTap: (){
                       productValue == "BULK SALE DISCOUNT" ?
                       createBulkProduct():
                       createProduct();
                     },
                     child: Container(
                       height: 40,
                       width: 180,
                       decoration: BoxDecoration(
                         color: Color(0xFFFF9200),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Center(
                         child: Text(
                           "Publish",
                           style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               color: Colors.white),
                         ),
                       ),
                     ),
                   ),
                 )
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),

         ],),
     )
          ],
        ),
      ),
    );
  }

  showDialogForMyPages() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select page'),
            content: Container(
              height: 300,
              child: FutureBuilder(
                  future: myPages(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // Show a loading indicator
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return  ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: pages.length, //photoList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,
                                      // width: 100,
                                        child: Text(
                                          pages[index]['page_title'].toString(),
                                        )),
                                    const Divider(),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  pageController.text =
                                      pages[index]['page_title'].toString();
                                  pageId =
                                      pages[index]['page_id'].toString();
                                   print("i am current page  ${  pageController.text}");
                                   print("i am current id  ${  pageId}");
                                  setState(() {});
                                },
                              );
                            });
                      }
                    }

                  }),
            ),
          );
        });
  }
  showDialogForRetuenable() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select'),
            content: Container(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: retuenableList.length, //photoList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        children: [
                          Container(
                            // height: 20,
                            // width: 100,
                              child: Text(
                                retuenableList[index].toString(),
                              )),
                          const Divider(),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        retuenableController.text =
                            retuenableList[index].toString();
                        print("i am current retuenableList  ${  retuenableController.text}");
                        
                        setState(() {});
                      },
                    );
                  })
            ),
          );
        });
  }
  showDialogForDeliveryCost() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select'),
            content: Container(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: deliveryCostList.length, //photoList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              // width: 100,
                                child: Text(
                                  deliveryCostList[index].toString(),
                                )),
                            const Divider(),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          deliveryCostController.text =
                              deliveryCostList[index].toString();
                          deliveryCostValue= index;

                          print("i am current retuenableList  ${  deliveryCostController.text}");
                          print("i am value deliveryCostValue  ${  deliveryCostValue}");

                          setState(() {});
                        },
                      );
                    })
            ),
          );
        });
  }
  showDialogForDeliveryType() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select'),
            content: Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: deliveryTypeList.length, //photoList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              // width: 100,
                                child: Text(
                                  deliveryTypeList[index].toString(),
                                )),
                            const Divider(),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          deliveryTypeController.text =
                              deliveryTypeList[index].toString();


                          print("i am current retuenableList  ${  deliveryTypeController.text}");


                          setState(() {});
                        },
                      );
                    })
            ),
          );
        });
  }
  showDialogForProductCatagory() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select catagory'),
            content: Container(
              height: 200,
              child: FutureBuilder(
                  future: getProductCatagory(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // Show a loading indicator
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: selectData.length, //photoList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 20,
                                      // width: 100,
                                        child: Text(
                                          selectData[index]['label'].toString(),
                                        )),
                                    const Divider(),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  productCatagory.text =
                                      selectData[index]['label'].toString();
                                  catagoryId =
                                      selectData[index]['value'].toString();
                                  // print("i am current label  ${  Catagory.text}");
                                  // print("i am current id  ${  catagoryId}");
                                  setState(() {});
                                },
                              );
                            });
                      }
                    }


                  }
              ),
            ),
          );
        });
  }
  showDialogForProductCondition() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select'),
            content: Container(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: condition.length, //photoList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Column(
                          children: [
                            Container(
                              // height: 20,
                              // width: 100,
                                child: Text(
                                  condition[index].toString(),
                                )),
                            const Divider(),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          productConditoin.text =
                              condition[index].toString();
                          conditoinId= index;

                          print("i am current retuenableList  ${  productConditoin.text}");
                          print("i am value deliveryCostValue  ${  conditoinId}");

                          setState(() {});
                        },
                      );
                    })
            ),
          );
        });
  }
}