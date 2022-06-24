import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep/providers/resep_provider.dart';

class ResepDetailPage extends StatefulWidget {
  const ResepDetailPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ResepDetailPage> createState() => _ResepDetailPageState();
}

class _ResepDetailPageState extends State<ResepDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          final recipe = resepProvider.resepDetailModel!.results;
          return Card(
            elevation: 1.0,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar
                    if (recipe.thumb.isNotEmpty)
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

                    // Waktu
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Waktu : ${recipe.times}'),
                    ),

                    // Athour
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Athour : ${recipe.author.user} \nPublish : ${recipe.author.datePublished}'),
                    ),

                    // Deskripsi
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Ket : ${recipe.desc}', textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
