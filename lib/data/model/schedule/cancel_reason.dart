enum CancelReason {
  reschedule(1),
  busy(2),
  askedByTutor(3),
  other(4);

  final int cancelId;

  const CancelReason(this.cancelId);
}