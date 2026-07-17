import 'package:flutter/material.dart';
import 'package:novanews/core/theme/app_colors.dart';
import 'package:novanews/core/theme/app_images.dart';
import 'package:novanews/features/auth/presentation/screens/login_screen.dart';
import 'package:novanews/features/home/data/model/product_model.dart';
import 'package:novanews/features/home/presentations/widgets/news_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // تأكد من استيراد هذه المكتبة

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // دالة لجلب البيانات من Supabase
  Future<List<ProductModel>> fetchNews() async {
    final response = await Supabase.instance.client.from('NovaNews').select();
    // تحويل القائمة القادمة إلى List من ProductModel
    return (response as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await Supabase.instance.client.auth.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
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

            // استخدام FutureBuilder لجلب البيانات من Supabase
            Expanded(
              child: FutureBuilder<List<ProductModel>>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No news found"));
                  }

                  final products = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return NewsCard(product: products[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
