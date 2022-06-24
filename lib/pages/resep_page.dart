import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/pages/resep_detail_page.dart';
import 'package:resep/providers/resep_provider.dart';

class ResepPage extends StatefulWidget {
  const ResepPage({Key? key}) : super(key: key);

  @override
  State<ResepPage> createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Resep'),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return ListView.builder(
            itemCount: resepProvider.resepModel!.results.length,
            itemBuilder: (context, index) {
              final recipe = resepProvider.resepModel!.results[index];
              return GestureDetector(
                onTap: () {
                  resepProvider.getDetailResep(recipe.key);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResepDetailPage(title: recipe.title),
                    ),
                  );
                },
                child: Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        Image.network(
                          recipe.thumb,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),

                        // Judul
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
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
