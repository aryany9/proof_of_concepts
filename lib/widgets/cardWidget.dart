import 'package:flutter/material.dart';
import 'package:proof_of_concepts/models/feedsModel.dart';

class CardWidget extends StatelessWidget {
  final RowData row;

  const CardWidget({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (row.title != null && row.description != null && row.imageHref != null) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            if (row.imageHref != null)
              Image.network(
                row.imageHref!,
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
                  if (row.title != null)
                    Text(
                      row.title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(
                      height:
                          10), // Giving vertical space between title and description
                  if (row.description != null)
                    Text(
                      row.description!,
                    ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
