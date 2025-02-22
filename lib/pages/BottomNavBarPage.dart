import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scanme/pages/FavoritePage.dart';
import 'package:scanme/pages/HomePage.dart';
import 'package:scanme/pages/ProfilePage.dart';
import 'package:scanme/pages/ScanPage.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentTab=0;
  final List<Widget> screens=[
    HomePage(),
    FavoritePage(),
    QrcodeScan(),
    ProfilePage()
  ];

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,

        child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen=HomePage();
                      currentTab=0;
                    });
                  }, padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: currentTab==0 ? Colors.blueAccent:Colors.black,
                      ),
                      Text("Accueil",style: TextStyle(
                          color: currentTab==0?Colors.blueAccent:Colors.black
                      ),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen=FavoritePage();
                      currentTab=1;
                    });
                  },padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: currentTab==1 ? Colors.blueAccent : Colors.black,
                      ),
                      Text("Favorie",style: TextStyle(
                          color: currentTab==1 ? Colors.blueAccent : Colors.black
                      ),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 20,
                  onPressed: (){
                    setState(() {
                      currentScreen=ProfilePage();
                      currentTab=3;
                    });
                  }, padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.perm_contact_calendar_rounded,
                        color: currentTab == 3 ? Colors.blueAccent:Colors.black,
                      ),
                      Text("Profil",style: TextStyle(
                          color: currentTab==3 ? Colors.blueAccent : Colors.black
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
