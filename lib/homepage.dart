import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/add_tweet_screen.dart';
import 'package:twitter_clone/services/auth_service.dart';
import 'package:twitter_clone/services/tweet_api.dart';
import 'package:twitter_clone/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool haveAvatar = false;
  String? myID;
  String? name;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var collection = FirebaseFirestore.instance.collection('users');
  late List<Map<String, dynamic>> userDetails;
  bool isLoaded = false;
  final TweetApi _tweetApi = TweetApi();

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppBar(
            title: SvgPicture.asset(
              'assets/icon.svg',
              height: 30,
              width: 30,
            ),
            leadingWidth: 42,
            leading: Builder(builder: (context) {
              return GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: haveAvatar
                      ? CircleAvatar()
                      : CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/default_avatar.png'),
                        ));
            }),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: signOut,
              ),
            ],
          ),
        ),
      ),
      drawer: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Center(child: CircularProgressIndicator());
            return Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [CircleAvatar(), Icon(Icons.more_vert)],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('$name'),
                      Text('@$myID'),
                      Row(
                        children: [
                          Text("199"),
                          SizedBox(
                            width: 6,
                          ),
                          Text("followers"),
                          SizedBox(
                            width: 12,
                          ),
                          Text("5"),
                          SizedBox(
                            width: 6,
                          ),
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
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTweetScreen()));
        },
        elevation: 0,
        shape: CircleBorder(),
        backgroundColor: Color(0xff1C9BEF).withOpacity(0.8),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildTweetList()),
        ],
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((value) {
        myID = value.data()!['uid'] ?? '';
        name = value.data()!['name'] ?? '';
      }).catchError((e) {
        print(e);
      });
    }
  }

  Widget _buildTweetList() {
    return StreamBuilder(
      stream: _tweetApi.getTweets(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('Something went wrong!');
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return ListView(
          children: snapshot.data!.docs.map((document) => _tweet(document)).toList(),
        );
      }
      );
  }

  Widget _tweet(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black, width: 0.1),
              bottom: BorderSide(color: Colors.black, width: 0.1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text(data['name']), Text(data['uid'])],
                ),
                Text(data['tweetContent']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.comment_rounded),
                    Icon(Icons.repeat),
                    Icon(Icons.favorite_border)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
