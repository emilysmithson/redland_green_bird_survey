import 'package:flutter/material.dart';

import '../../../settings.dart';

class RGListTile extends StatefulWidget {
  final String? imageAsset;
  final Widget? widget;
  final bool? imageLeft;
  final Widget? navigateTo;
  final String? heroTag;
  final Alignment? alignment;

  const RGListTile({
    super.key,
    this.imageAsset,
    this.widget,
    this.imageLeft,
    this.navigateTo,
    this.heroTag,
    this.alignment,
  });

  @override
  State<RGListTile> createState() => _RGListTileState();
}

class _RGListTileState extends State<RGListTile> {
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
      child: Container(
        decoration: defaultBoxDecoration(),
        margin: const EdgeInsets.all(8.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: pressed
                ? []
                : [
                    const BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                    ),
                  ],
          ),
          child: Row(
            children: [
              if (widget.imageLeft!)
                Flexible(
                  child: Hero(
                    tag: widget.heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: widget.alignment ?? Alignment.center,
                          image: AssetImage(widget.imageAsset!),
                        ),
                      ),
                    ),
                  ),
                ),
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(widget.imageLeft! ? 20.0 : 0),
                    bottomRight: Radius.circular(widget.imageLeft! ? 20.0 : 0),
                    topLeft: Radius.circular(widget.imageLeft! ? 0.0 : 20),
                    bottomLeft: Radius.circular(widget.imageLeft! ? 0.0 : 20),
                  ),
                  child: Container(
                    height: double.infinity,
                    color: Colors.green[50],
                    child: widget.widget,
                  ),
                ),
              ),
              if (!widget.imageLeft!)
                Flexible(
                  child: Hero(
                    tag: widget.heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: widget.alignment ?? Alignment.center,
                          image: AssetImage(widget.imageAsset!),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
