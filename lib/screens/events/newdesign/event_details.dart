import 'package:flutter/material.dart';
class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/rectangle.png"),
                fit: BoxFit.cover,
              )
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Cricket Match PSL 8 this year",style: TextStyle(fontSize: 18, color: Colors.black), ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(child: Expanded(child: Text("Cricket Match PSL 8 this year ricket Match PSL 8 this yearm ricket Match PSL 8 this year",style: TextStyle(fontSize: 11, color: Colors.grey.shade400), ))),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
              child: Image.asset("assets/images/Calendar.png", color: Colors.white,),
            ),
            title: Text(
              "kjkj",
             // events[index]['start_date'],
              style: TextStyle(
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "cxcxcx",
             // events[index]['end_date'],
              style: TextStyle(
                  color: Color(0xFF747688),
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
              child: Image.asset("assets/images/location.png"),
            ),
            title: Text(
              "ccc",
           //   events[index]['location'],
              style: TextStyle(
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "36 Rot street, Los angeles",
              style: TextStyle(
                  color: Color(0xFF747688),
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Container(
            height: 40,
            width: double.infinity,
            color: Color(0xffF8F9FB),
            child: Row(children: [
              SizedBox(width:15,),
              Text("2.3k",style: TextStyle(fontSize: 10, color: Colors.grey.shade400), ),
              Expanded(child: SizedBox(width: 0,)),
              Text("4.3K Comments | 1.9K Revibed",style: TextStyle(fontSize: 10, color: Colors.grey.shade400), )  ,


              SizedBox(width:15,),

            ],),
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/Heart-4.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'React',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Row(children: [

                        Image.asset('images/Chat-4.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Comment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],),
                    ),

                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Row(children: [
                        Image.asset('images/share icon.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],),
                    )

                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Image.asset('images/emojis F.png'),
                    Image.asset('images/heart.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '48.8k',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      '3.2k Comments || 875 Shares',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Here is just the Lorem Ipsum text which is nothing but dummy text of the printing and typesetting #trending #post',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {


                      },
                      child: Text(
                        'View comments',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
