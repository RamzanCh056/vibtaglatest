import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              title: Text(
                "General",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Setting-3.png"),
              ),
              children: [
                Divider(
                  indent: 16,endIndent: 16,
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Profile-3.png"),
                  ),
                  title: Text(
                    "General",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Subtract.png"),
                  ),
                  title: Text(
                    "Language Settings",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              title: Text(
                "Security",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Vector (3).png"),
              ),
              children: [
                Divider(
                  indent: 16,endIndent: 16,
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Vector (4).png"),
                  ),
                  title: Text(
                    "Privacy",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Vector (5).png"),
                  ),
                  title: Text(
                    "Password",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/presentation 1.png"),
                  ),
                  title: Text(
                    "Manage Sessions",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              title: Text(
                "Design",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/paint-palette 1.png"),
              ),
              children: [
                Divider(
                  indent: 16,endIndent: 16,
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Vector (6).png"),
                  ),
                  title: Text(
                    "Avatar & Cover",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              trailing: Opacity(
                  opacity: 0,
                  child: Icon(Icons.abc)),
              title: Text(
                "Design",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Icon.png"),
              ),
            ),
            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              trailing: Opacity(
                  opacity: 0,
                  child: Icon(Icons.abc)),
              title: Text(
                "Notification",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Notification-3.png"),
              ),
            ),

            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              title: Text(
                "Earnings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/surface1.png"),
              ),
              children: [
                Divider(
                  indent: 16,endIndent: 16,
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Wallet-3.png"),
                  ),
                  title: Text(
                    "Current Balance",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/Swap-2.png"),
                  ),
                  title: Text(
                    "Transactions",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/drawerIcons/presentation 1.png"),
                  ),
                  title: Text(
                    "Manage Sessions",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),
            ExpansionTileCard(
              animateTrailing: false,
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              trailing: Opacity(
                  opacity: 0,
                  child: Icon(Icons.abc)),
              title: Text(
                "My Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Paper-2.png"),
              ),
            ),


            SizedBox(height: 20,),
            ExpansionTileCard(
              baseColor: Color(0xFFF9FAFC),
              expandedColor: Color(0xFFF9FAFC),
              trailing: Opacity(
                  opacity: 0,
                  child: Icon(Icons.abc)),
              title: Text(
                "Delete Account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/drawerIcons/Group 77268.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
