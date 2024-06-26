import 'package:flutter/material.dart';

import '../bottom_navigation/bottom_navigation_bar.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/newone.jfif'),
            ),
            SizedBox(width: 10),
            Text('Good Morning\nBorkat 👋', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStorySection(context),
            _buildNavigationTabs(),
            _buildPostCard(
              context,
              'Padar Island, Caribbean Sensation in Eastern Indonesia',
              'assets/landmark.jpeg',
              'Amanda',
              '2345',
              '543',
            ),
            _buildPostCard(
              context,
              'Top 7 Destination at Mount Bromo!',
              'assets/landmark.jpeg',
              'Daniel',
              '1323',
              '321',
            ),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavigation(),
    );
  }

  Widget _buildStorySection(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStoryItem(context, 'assets/landmark.jpeg', 'Add Story'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'Sarah'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'John'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'Mike'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'John'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'Mike'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'John'),
          _buildStoryItem(context, 'assets/landmark.jpeg', 'Mike'),
        ],
      ),
    );
  }

  Widget _buildStoryItem(BuildContext context, String imagePath, String userName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageScreen(imagePath: imagePath, userName: userName, author: '', title: '',),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 5),
            Text(userName),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationTabs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildNavTab('Popular', true),
          _buildNavTab('Following', true),
          _buildNavTab('New', false),
          _buildNavTab('Beach', false),
          _buildNavTab('Hiking', false),
        ],
      ),
    );
  }

  Widget _buildNavTab(String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.blue : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(title),
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, String title, String imagePath, String author, String likes, String comments) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageScreen(imagePath: imagePath, userName: '', author: author, title: title,),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset(imagePath),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(title),
              subtitle: Text(author),
              trailing: Icon(Icons.more_vert),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 5),
                    Text(likes),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(comments),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String imagePath;
  final String userName;
  final String author;
  final String title;

  ImageScreen({required this.imagePath,  required this.userName, required this.author, required this.title});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3  ), () {
      Navigator.pop(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal,fontSize: 17,),),
            SizedBox(height: 5,),
            Image.asset(imagePath),
            Text(userName,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),),
            Text(author,style: TextStyle(color: Colors.indigo,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),)

          ],
        ),
      ),
    );
  }
}