import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class InboxCard extends StatefulWidget {
  final Map<String, String> user;
  const InboxCard({
    super.key,
    required this.user,
  });

  @override
  State<InboxCard> createState() => _InboxCardState();
}

class _InboxCardState extends State<InboxCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.user["unread"]! == "0"
              ? AppColors.unreadMsg
              : AppColors.readMsg,
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(widget.user["image"]!),
                      ),
                      if (widget.user["recently_seen"]! == "online")
                        Positioned(
                            bottom: 4,
                            right: 4,
                            child: Icon(Icons.circle,
                                color: AppColors.vibrantGreen, size: 10)
                        ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.user["name"]!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(widget.user["message"]!, overflow: TextOverflow.ellipsis, maxLines: 1,)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.user["time"]!),
                      Opacity(
                        opacity: widget.user["unread"]! == "0" ? 0 : 1,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.primaryRed,
                          child: Text(widget.user["unread"]!,
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
