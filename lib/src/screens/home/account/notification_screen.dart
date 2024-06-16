import 'package:bookstore/src/models/notification_model.dart';
import 'package:bookstore/src/widgets/account/card_notification.dart';
import 'package:bookstore/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NotifcationScreen extends StatelessWidget {
  const NotifcationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notiList = List.generate(
        5,
        (index) => NotificationModel(
            "$index",
            "Title $index",
            "description $index",
            "https://images.pexels.com/photos/13862436/pexels-photo-13862436.png",
            false));

    return (Scaffold(
        body: Column(
      children: [
        CustomText(title: "Notifcation screen"),
        SizedBox(
          width: const BoxConstraints().maxWidth,
          height: 300,
          child: ListView.builder(
              itemCount: notiList.length,
              itemBuilder: (context, index) =>
                  CardNotification(noti: notiList[index])),
        )
      ],
    )));
  }
}
