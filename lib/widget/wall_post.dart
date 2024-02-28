import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/helper/helper_methods.dart';
import 'package:socialmidia/pages/home/comment_button.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_comment.dart';
import 'package:socialmidia/widget/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final String time;
  final List<String> likes;

  const WallPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
    required this.time,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  final commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLikes() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef = FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([
          currentUser.email
        ])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([
          currentUser.email
        ])
      });
    }
  }

  void addComment(String commentText) {
    FirebaseFirestore.instance.collection('User Posts').doc(widget.postId).collection('Comments').add({
      'CommentText': commentText,
      'CommentedBy': currentUser.email,
      'CommentTime': Timestamp.now(),
    });
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Comentar',
            style: GoogleFonts.poppins(
              color: DefaultColors.preto,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          content: TextField(
            controller: commentTextController,
            decoration: InputDecoration(
              hintText: 'Digite seu comentário',
              hintStyle: GoogleFonts.poppins(
                color: DefaultColors.preto,
                fontSize: 12.sp,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                commentTextController.clear();
              },
              child: Text(
                'Cancelar',
                style: GoogleFonts.poppins(),
              ),
            ),
            TextButton(
              onPressed: () {
                addComment(commentTextController.text);
                commentTextController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Comentar',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.backgroundPost,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      margin: EdgeInsets.only(
        top: 25.h,
        left: 25.h,
        right: 25.h,
      ),
      padding: EdgeInsets.all(
        25.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.message,
                          style: GoogleFonts.poppins(
                            color: DefaultColors.branco.withOpacity(.6),
                            fontSize: 10.sp,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.time,
                          style: GoogleFonts.poppins(
                            color: DefaultColors.branco.withOpacity(.6),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.user,
                      style: GoogleFonts.poppins(
                        color: DefaultColors.branco,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  LikeButton(
                    isLiked: isLiked,
                    onTap: toggleLikes,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    widget.likes.length.toString(),
                    style: GoogleFonts.poppins(
                      color: DefaultColors.branco,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CommentButton(onTap: showCommentDialog),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    widget.likes.length.toString(),
                    style: GoogleFonts.poppins(
                      color: DefaultColors.branco,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User Posts')
                .doc(widget.postId)
                .collection('Comments')
                .orderBy(
                  "CommentTime",
                  descending: true,
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs
                    .map((doc) {
                      final commentData = doc.data() as Map<String, dynamic>;

                      return DefaultComment(
                        text: commentData["CommentText"],
                        user: commentData["CommentedBy"],
                        time: formatDate(commentData["CommentTime"]),
                      );
                    })
                    .map<Widget>((commentWidget) => commentWidget)
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
