import 'package:adstack/widgets/AllProjectsContainer.dart';
import 'package:adstack/widgets/TopCreator.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // First Container with Rounded Edges and Image
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: double.infinity,
                  height: 300, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('https://t3.ftcdn.net/jpg/06/33/58/04/360_F_633580478_nnmZcvm8ABzTKljmjTko4Sh7qp2H1rX3.jpg'), // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.3),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Top Rating Project',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This project has received the highest ratings and is recognized for its outstanding performance and innovation.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your learn more action here
                            },
                            style: ElevatedButton.styleFrom(
                              // Text color
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Learn More',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            if (isMobile) ...[
              Container(
                height: 250,
                color: Colors.blue[300],
                child: AllProjectsContainer(),
              ),
              SizedBox(height: 16),
              Container(
                height: 250,
                color: Colors.blue[700],
                child: TopCreatorContainer(),
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      color: Colors.blue[300],
                      child: AllProjectsContainer(),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 300,
                      color: Colors.blue[700],
                      child: TopCreatorContainer(),
                    ),
                  ),
                ],
              ),
            ],

            // Row with Two Containers


            SizedBox(height: 15),

            // Another Container with Image
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              //padding: EdgeInsets.all(10),
              child: Image.network(
                'https://horizon-ui.com/static/media/main-chart-pro.d8d2e71362e2556d69af.png',
                height: isMobile ? 300 : 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




