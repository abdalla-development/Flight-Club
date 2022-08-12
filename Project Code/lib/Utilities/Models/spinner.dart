import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SpinKitThreeInOut(
              size: 100,
              // controller: _controller.forward(),
              itemBuilder: (context, index) {
                final colors = [
                  const Color(0xffA85CF9),
                  const Color(0xffFF6FB5),
                  const Color(0xff125B50),
                  const Color(0xff4B7BE5),
                  const Color(0xffF8CB2E),
                  const Color(0xffEDE6DB),
                  const Color(0xff8E3200),
                  const Color(0xff383838),
                  const Color(0xff525E75),
                  const Color(0xff30AADD),
                  const Color(0xff8FBDD3),
                  const Color(0xff46244C),
                  const Color(0xff5F7464),
                  const Color(0xff534340),
                  const Color(0xffC1F4C5),
                  const Color(0xff1C658C),
                ];
                final color = colors[index % colors.length];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
