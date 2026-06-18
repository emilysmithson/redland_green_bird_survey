import 'package:flutter/material.dart';

class RGGridTile extends StatefulWidget {
  final String? text;
  final String? imageAsset;
  final Widget? navigateTo;
  final String? heroTag;
  final Function? setState;

  const RGGridTile({
    super.key,
    this.text,
    this.imageAsset,
    this.navigateTo,
    this.heroTag,
    this.setState,
  });

  @override
  State<RGGridTile> createState() => _RGGridTileState();
}

class _RGGridTileState extends State<RGGridTile> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          pressed = true;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.navigateTo!),
        );
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          pressed = false;
        });
      },
      child: Hero(
        tag: widget.heroTag!,
        child: Material(
          color: Colors.green[100],
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 200,
            height: 200,
            // margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.imageAsset!),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.white60,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
