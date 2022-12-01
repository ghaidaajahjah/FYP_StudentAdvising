import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:student_advising_app/models/user.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    MyUser user = Provider.of<MyUser>(context);
    String pageRouteName = '';
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo[200]),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic!),
                  radius: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  ' ${user.firstName} ${user.lastName}',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.chat,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.group,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Meetings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Semester Schedule',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.school,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Graduation Plan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () => {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.location_city,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Campus map',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.thumb_up,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Course Feedback',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Calender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
