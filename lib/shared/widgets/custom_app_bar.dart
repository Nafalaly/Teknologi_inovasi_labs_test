part of '../shared.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.context,
    this.subtitle,
    Function? onBackButtonPressed,
    this.onTrailingButtonPressed,
    this.height = 100,
    this.color = Colors.white,
    this.trailingColor = Colors.white,
    this.textColor = Colors.black,
    this.trailingIcon,
    this.hideBackButton = false,
  }) : super(key: key) {
    if (onBackButtonPressed != null) {
      this.onBackButtonPressed = onBackButtonPressed;
    } else {
      this.onBackButtonPressed = () {
        Navigator.pop(context);
      };
    }
  }
  bool hideBackButton;
  final String title;
  final BuildContext context;
  final String? subtitle;
  final double? height;
  final Color color;
  final Color trailingColor;
  final Color textColor;
  late Function onBackButtonPressed;
  final Function? onTrailingButtonPressed;
  final dynamic trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      width: DeviceScreen.devWidth,
      height: height,
      color: color,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  !hideBackButton
                      ? InkWell(
                          onTap: () {
                            onBackButtonPressed();
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 26),
                            decoration: const BoxDecoration(),
                            child: Icon(Icons.arrow_back_ios_outlined,
                                color: textColor),
                          ),
                        )
                      : const SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            // ignore: unnecessary_null_comparison
                            color: textColor),
                      ),
                      Text(
                        subtitle ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: textColor, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // ignore: unnecessary_null_comparison
            onTrailingButtonPressed != null
                ? InkWell(
                    onTap: () {
                      if (onTrailingButtonPressed != null) {
                        onTrailingButtonPressed!();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 60,
                      child: Icon(
                        trailingIcon,
                        color: trailingColor,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
