import 'package:flutter/material.dart';
import 'package:novanews/core/widgets/news_card.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsCard news;

  const NewsDetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.60,
            child: Image.asset(news.image, fit: BoxFit.cover),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.30),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                      news.category.toUpperCase(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      news.data,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
