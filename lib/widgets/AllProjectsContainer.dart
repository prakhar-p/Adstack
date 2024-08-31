import 'package:flutter/material.dart';

class AllProjectsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blueGrey[900], // Navy blue background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: MouseRegion(
                        onEnter: (event) => _onHover(context, true, index),
                        onExit: (event) => _onHover(context, false, index),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: index == _hoveredIndex
                                ? Colors.redAccent[100] // Light red on hover
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaWnwRMdUxT0tnxKoqdwb3p73-5gFcjx2h0_r8xXQBsmSo4M688BRcVY-wMVcHWsVg604&usqp=CAU',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Technology Behind the Blockchain',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'See More Details...',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.black),
                                onPressed: () {
                                  // Add your edit action here
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _hoveredIndex = -1;

  void _onHover(BuildContext context, bool hovering, int index) {
    if (hovering) {
      _hoveredIndex = index;
    } else {
      _hoveredIndex = -1;
    }
    (context as Element).markNeedsBuild(); // Trigger rebuild on hover
  }
}
