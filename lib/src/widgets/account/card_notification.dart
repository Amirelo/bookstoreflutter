import 'package:bookstore/src/models/notification_model.dart';
import 'package:bookstore/src/widgets/custom_image.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  final NotificationModel noti;
  const CardNotification({super.key, required this.noti});

  @override
  Widget build(BuildContext context) {
    return (Container(
      color: Colors.green,
      child: Row(children: [
        CustomImage(imageLink: noti.image),
        Column(
          children: [
            CustomText(title: noti.title),
            CustomText(title: noti.description),
          ],
        ),
        CustomText(title: "${noti.status}")
      ]),
    ));
  }
}
