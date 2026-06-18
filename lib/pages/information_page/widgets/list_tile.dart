import 'package:flutter/material.dart';

Widget listTile({
  Function? onTap,
  required bool imageLeft,
  String? imageAsset,
  required List<Widget> content,
  int? photoRatio,
}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        children: [
          if (imageLeft)
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageAsset!),
                  ),
                ),
              ),
            ),
          Flexible(
            flex: photoRatio ?? 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(imageLeft ? 20.0 : 0),
                  bottomRight: Radius.circular(imageLeft ? 20.0 : 0),
                  topLeft: Radius.circular(imageLeft ? 0.0 : 20),
                  bottomLeft: Radius.circular(imageLeft ? 0.0 : 20),
                ),
              ),
              child: SizedBox(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: content,
                  ),
                ),
              ),
            ),
          ),
          if (!imageLeft)
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageAsset!),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
