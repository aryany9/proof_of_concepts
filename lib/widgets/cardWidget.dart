import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proof_of_concepts/models/feedsModel.dart';

class CardWidget extends StatelessWidget {
  final RowData row;
  const CardWidget({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: row.imageHref ??
                "https://www.google.com/", // passing random url incase of null images to show error widget
            errorWidget: (context, url, error) => const Icon(
              Icons.broken_image_rounded,
              size: 50,
            ),
            height: 100,
            width: 100,
          ),
          const SizedBox(
              width: 10), // Giving horizontal space between image and text
          Expanded(
            // using Expanded widget for giving maximum space to content not image.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.title ?? "No title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                    height:
                        10), // Giving vertical space between title and description

                Text(
                  row.description ?? "No Description",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
