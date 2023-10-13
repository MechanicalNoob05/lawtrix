import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Legal Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Explore Legal Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ServiceCategory(
              title: 'Advocates',
              image: 'assets/advocates.jpg',
            ),
            ServiceCategory(
              title: 'Arbitrators',
              image: 'assets/arbitrators.jpg',
            ),
            ServiceCategory(
              title: 'Mediators',
              image: 'assets/mediators.jpg',
            ),
            ServiceCategory(
              title: 'Notaries',
              image: 'assets/notaries.jpg',
            ),
            ServiceCategory(
              title: 'Document Writers',
              image: 'assets/document_writers.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCategory extends StatelessWidget {
  final String title;
  final String image;

  ServiceCategory({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to the list of service providers in this category
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ServiceProvidersList(category: title),
            ),
          );
        },
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceProvidersList extends StatelessWidget {
  final String category;

  ServiceProvidersList({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal $category'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of service providers
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Service Provider $index'),
            subtitle: Text('Details about the service provider'),
            onTap: () {
              // Navigate to the service provider's profile
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ServiceProviderProfile(
                    serviceName: '$category Service',
                    providerName: 'Service Provider $index',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ServiceProviderProfile extends StatelessWidget {
  final String serviceName;
  final String providerName;

  ServiceProviderProfile({
    required this.serviceName,
    required this.providerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$serviceName Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Service Provider: $providerName'),
            // Add more details about the service provider here
          ],
        ),
      ),
    );
  }
}
