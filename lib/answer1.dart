import 'package:flutter/material.dart';

class Answer1CommentCard extends StatelessWidget {
  const Answer1CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Thread'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Card(
            elevation: 1,
            color: Colors.white, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommentItem(
                    avatarText: 'A',
                    userName: 'User A',
                    commentText: 'This is the main comment. Flutter layouts are fun!',
                    avatarColor: Color.fromARGB(255, 206, 156, 223), 
                    textColor: Color.fromARGB(255, 90, 23, 113), 
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0),
                        child: Row(
                          children: const [
                            Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.black54),
                            Text(' 12', style: TextStyle(color: Colors.black54, fontSize: 13)),                            
                            SizedBox(width: 20),                      
                            Icon(Icons.comment_outlined, size: 18, color: Colors.black54),
                            Text(' Reply', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 13)),
                          ],
                        ),
                      ),
                      
                      const Spacer(),
                      const Text('1h ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),

                  const SizedBox(height: 20), 

                  Padding( 
                    padding: const EdgeInsets.only(left: 40.0), 
                    child: const CommentItem(
                      avatarText: 'B',
                      userName: 'User B',
                      commentText: 'I agree!',
                      avatarColor: Color.fromARGB(255, 60, 118, 162), 
                      textColor: Color.fromARGB(255, 251, 251, 255),
                      avatarRadius: 18,
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String avatarText;
  final String userName;
  final String commentText;
  final Color avatarColor; 
  final Color textColor;
  final double avatarRadius;

  const CommentItem({
    super.key,
    required this.avatarText,
    required this.userName,
    required this.commentText,
    required this.avatarColor,
    required this.textColor,
    this.avatarRadius = 24, 
  }); 

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: avatarColor.withOpacity(0.4), 
          child: Text(
            avatarText, 
            style: TextStyle(
              color: textColor, 
              fontWeight: FontWeight.bold
            )
          ),
        ),
        const SizedBox(width: 10), 
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                userName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(commentText, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}