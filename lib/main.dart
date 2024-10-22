import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          title: Row(
            children: [
              Text(
                "Seattle, USA",
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ],
          ),
          actions: [
            IconButton(
               padding: EdgeInsets.all(10),  // Crește zona activă
              icon: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                print("Am apasat pe bell");
                 
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Expanded(
            // padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // Search bar
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    
                    hintText: "Search doctor...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),

                
                Container(
                  height: 200, 
                  child: CarouselWithDots(), 
                ),

                
                Container(
                  height: MediaQuery.of(context).size.height - 416,
                  child: CategoriesScreen(),
                ),
                Container(
                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0), 
                 child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nearby Medical Centers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              
            },
            child: Text(
              'See All',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
                ),
                MedicalCenterCarousel(),
                
                DoctorProfile(
              name: 'Dr. David Patel',
              specialty: 'Cardiologist',
              location: 'Cardiology Center, USA',
              rating: 4.2,
              reviews: 2000,
              imageUrl: 'https://media.istockphoto.com/id/1346124900/photo/confident-successful-mature-doctor-at-hospital.jpg?s=612x612&w=0&k=20&c=S93n5iTDVG3_kJ9euNNUKVl9pgXTOdVQcI_oDGG-QlE=',
            ),
            DoctorProfile(
              name: 'Dr. David Patel',
              specialty: 'Chirurg',
              location: 'Men\'s Clinic, England',
              rating: 4.8,
              reviews: 1872,
              imageUrl: 'https://familydoctor.org/wp-content/uploads/2018/02/41808433_l.jpg',
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String mainText1;
  final String mainText2;
  final String subtitle;

  CarouselItem({
    required this.imagePath,
    required this.mainText1,
    required this.mainText2,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
       children: [
             Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
  
        Positioned(
          top: 0,
          bottom: 0,
          left: 20,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.black54, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mainText1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mainText2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), 
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14, 
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselWithDots extends StatefulWidget {
  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, 
      child: Stack(
        children: [
         
          ClipRRect(
  borderRadius: BorderRadius.circular(20), 
  child: Stack( 
    children: [
      PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          CarouselItem(
            imagePath: 'assets/doctor_image1.jpg',
            mainText1: "Looking for",
            mainText2: "specialist doctor?",
            subtitle: "Schedule an appointment",
          ),
          CarouselItem(
            imagePath: 'assets/doctor_image2.jpg',
            mainText1: "Looking for",
            mainText2: "specialist doctor?",
            subtitle: "Schedule an appointment",
          ),
          CarouselItem(
            imagePath: 'assets/doctor_image3.jpg',
            mainText1: "Looking for",
            mainText2: "specialist doctor?",
            subtitle: "Schedule an appointment",
          ),
        ],
      ),

      
      Positioned(
        bottom: 10, 
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 24.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(12.0),
              ),
            );
          }),
        ),
      ),
    ],
  ),
),
        ],
      ),
    );
  }
}


class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category('Dentistry', 'assets/icon1.png', const Color(0xFFEF5350)),
    Category('Cardiology', 'assets/cardiology.png', const Color(0xFF42A5F5)),
    Category('Pulmonology', 'assets/pulmonology.png', const Color(0xFF66BB6A)),
    Category('General', 'assets/icon1.png', const Color(0xFFFFA726)),
    Category('Neurology', 'assets/icon1.png', const Color(0xFFAB47BC)),
    Category('Gastroenterology', 'assets/icon1.png', const Color(0xFFEC407A)),
    Category('Laboratory', 'assets/icon1.png', const Color(0xFF26A69A)),
    Category('Vaccination', 'assets/icon1.png', const Color(0xFFFFEE58)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
         style: TextStyle(
      fontWeight: FontWeight.bold,)),
        
        actions: [
          TextButton(
            onPressed: () {
              
            },
           child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), 
          child: Text(
            'See All',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              category: category,
              onTap: () {
                
              },
            );
          },
        ),
      ),
    );
  }
}


class Category {
  final String name;
  final String iconPath;
  final Color color; 

  Category(this.name, this.iconPath, this.color);
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: category.color, 
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  category.iconPath, 
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            category.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}



//Carousel2
class MedicalCenterCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.8);

    return Padding(
      
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 250,
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            MedicalCenterCard(
              imageUrl: 'assets/hosp1.jpg',
              name: 'Sunrise Health Clinic',
              address: '123 Oak Street, CA 98765',
              rating: 5.0,
              reviews: 58,
              distance: '4 km',
              time: '60min',
              icon: Icons.local_hospital,
              onTap: () {
                // Logica la apăsare
                print('Tapped on Sunrise Health Clinic');
                
              },
            ),
            MedicalCenterCard(
              imageUrl: 'assets/icon1.png',
              name: 'Golden Cardiology',
              address: '555 Bridge Street, CA 12345',
              rating: 4.9,
              reviews: 100,
              distance: '2.5 km',
              time: '40min',
              icon: Icons.favorite,
              onTap: () {
                
                print('Tapped on Golden Cardiology');
                
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

class MedicalCenterCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final double rating;
  final int reviews;
  final String distance;
  final String time;
  final IconData icon;
  final VoidCallback onTap;

  MedicalCenterCard({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(address),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        Text('$rating (${reviews} Reviews)'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_walk, size: 16),
                            SizedBox(width: 5),
                            Text('$distance/$time'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(icon, size: 16),
                            SizedBox(width: 5),
                            Text('Hospital'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Doctors
class DoctorProfile extends StatelessWidget {
  final String name;
  final String specialty;
  final String location;
  final double rating;
  final int reviews;
  final String imageUrl;

  DoctorProfile({
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  @override
 Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      imageUrl,
                      width: 150,
                      height: 130,
                      fit: BoxFit.contain, 
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text(specialty, style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(height: 8),
                        Text(location, style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text('$rating', style: TextStyle(fontSize: 16)),
                            SizedBox(width: 8),
                            Text('($reviews Reviews)', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.favorite_border, color: const Color.fromARGB(255, 5, 5, 5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


