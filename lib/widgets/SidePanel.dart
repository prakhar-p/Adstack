import 'package:adstack/screens/Attendance.dart';
import 'package:adstack/screens/Employees.dart';
import 'package:adstack/screens/HomeContent.dart';
import 'package:adstack/screens/Setting.dart';
import 'package:adstack/screens/Summary.dart';
import 'package:adstack/widgets/Sidebaroption.dart';
import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: isMobile ? 300 : 250,
      color: Colors.black,
      child: Column(

        children: [
          // Company Logo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: isMobile
                ? Icon(Icons.business, color: Colors.white, size: 40)
                : Image.asset('images/logo.png', height: 50),
          ),
          Divider(color: Colors.white,indent: 20,endIndent: 20),

          // User Image
          CircleAvatar(
            radius: isMobile ? 15 : 30,
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
          SizedBox(height: 10),
          Text('Prakhar Mishra',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),

          Text('Admin',style: TextStyle(fontSize: 10,color: Colors.grey,fontWeight: FontWeight.bold),),
          SizedBox(height: 12),
          Divider(color: Colors.white,indent: 20,endIndent: 20),
          // Sidebar Options
          SidebarOption(
            icon:Icons.home,
            title: 'Home',

            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeContentScreen()),
              );
            },
          ),
          SidebarOption(
            icon: Icons.people,
            title: 'Employees',
            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeesScreen()),
              );
            }, // Example sub-options
          ),
          SidebarOption(
            icon: Icons.access_time,
            title: 'Attendance',
            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()),
              );
            },
          ),
          SidebarOption(
            icon: Icons.summarize,
            title: 'Summary',
            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryScreen()),
              );
            },
          ),
          SidebarOption(
            icon: Icons.work,
            title: 'Workspace',
            isExpanded: !isMobile,
            onTap: () {},
            subOptions: ['Adstack', 'Finance'], // Workspace sub-options
          ),

          Spacer(),
          SidebarOption(
            icon: Icons.settings,
            title: 'Settings',
            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          SidebarOption(
            icon: Icons.logout,
            title: 'Logout',
            isExpanded: !isMobile,
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Handle logout logic
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}