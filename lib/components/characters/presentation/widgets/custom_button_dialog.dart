import 'package:flutter/material.dart';

class CustomButtonDialog extends StatelessWidget {
  const CustomButtonDialog({
    super.key,
    this.imageUrl,
    this.title,
    this.content
  });

  final String? imageUrl;
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                          imageUrl ?? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                        ),
                        maxRadius: 40,
                      ),
                      Text(
                        title ?? "Api sources:", 
                        style: TextStyle(fontSize: 22.0),
                      ),// Title
                      Text(
                        content ?? "https://rickandmortyapi.com/", 
                        style: TextStyle(fontSize: 22.0),
                      ), // Content
                      Center(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: Icon(Icons.close)
                        )
                      )
                    ],
                  ),
                ),
              );
            });
          }, icon: Icon(Icons.info));
  }
}