import 'package:flutter/material.dart';

class ProfileBodyCard extends StatelessWidget {
  final String listTitle;
  final Widget iconName, iconTrailing;
  final Function onTapCard;
  const ProfileBodyCard(
      {Key key,
      this.listTitle,
      this.iconName,
      this.onTapCard,
      this.iconTrailing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Card(
        child: ListTile(
            title: Text(listTitle), leading: iconName, trailing: iconTrailing),
      ),
    );
  }
}
