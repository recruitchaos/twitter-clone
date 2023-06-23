import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/add_tweet_screen.dart';
import 'package:twitter_clone/services/auth_service.dart';
import 'package:twitter_clone/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool haveAvatar = false;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppBar(
            title: SvgPicture.asset('assets/icon.svg', height: 30, width: 30,),
            leadingWidth: 42,
            leading: Builder(builder: (context) {
              return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: haveAvatar ? CircleAvatar() : CircleAvatar( backgroundImage: AssetImage('assets/default_avatar.png'), ));
            }),
            centerTitle: true,
            actions: [
              IconButton(icon: Icon(Icons.logout), onPressed: signOut,),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(),
                    Icon(Icons.more_vert)
                  ],
                ),
                SizedBox(height: 12,),
                Text("N A M E"),
                Text("@username"),
                Row(
                  children: [
                    Text("199"),
                    SizedBox(width: 6,),
                    Text("followers"),
                    SizedBox(width: 12,),
                    Text("5"),
                    SizedBox(width: 6,),
                    Text("following"),
                  ],
                )
              ],
            )),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.mode_comment_outlined),
              title: Text("Topics"),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text("Bookmarks"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTweetScreen()));
      },
            elevation: 0,
            shape: CircleBorder(),
            backgroundColor: Color(0xff1C9BEF).withOpacity(0.8),
            child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}