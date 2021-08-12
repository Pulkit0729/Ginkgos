class CancelObject {
  final String by;
  final String reason;
  final String? comments;

  CancelObject({required this.by, required this.reason, this.comments});

  Map<String, dynamic> toJson() => {
        "By": by.toString(),
        "Reason": reason.toString(),
        "Comments": comments.toString()
      };
}
