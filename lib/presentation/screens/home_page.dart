import 'package:flutter/material.dart';
import 'package:novanews/core/app_images.dart';
import 'package:novanews/core/widgets/news_card.dart' show NewsCard;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconButton(icon: Icon(Icons.menu), onPressed: null),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: Image(image: AssetImage(AppImage.logo2)),
                  ),
                  const IconButton(icon: Icon(Icons.search), onPressed: null),
                ],
              ),
            ),

            const Text(
              "The Morning Brief",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: Text(
                "Curated insights for the modern professional.\n Stay ahead of the curve.",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  NewsCard(
                    image: "assets/image/quantemcomputing.jpg",
                    title: "The Future of Quantum Computing",
                    category: "Technology",
                    data:
                        "quantum computing is poised to revolutionize industries from cryptography to drug discovery. By leveraging the principles of quantum mechanics, these computers can solve problems that are currently intractable for classical machines, opening new frontiers in science and technology.",
                  ),
                  NewsCard(
                    image: "assets/image/culture.jpg",
                    title: "Modernism Reimagined",
                    category: "Culture",
                    data:
                        "Modernism Reimagined is a design and architectural movement that reinterprets mid-century principles—emphasizing function, simplicity, and natural materials—for the 21st century. By stripping away excess ornamentation, this approach blends historical modernist layouts with modern technology, sustainability, and adaptive reuse.",
                  ),
                  NewsCard(
                    image: "assets/image/sports.jpg",
                    title: "The Fastest Cars of 2024",
                    category: "Sports",
                    data:
                        "From the sleek lines of the Bugatti Chiron to the raw power of the Tesla Roadster, 2024 has seen some of the fastest cars ever produced. These vehicles not only boast incredible top speeds but also feature cutting-edge technology and design that push the boundaries of automotive engineering.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
