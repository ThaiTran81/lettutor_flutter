class OnboardingModel {
  String? image;
  String? title;
  String? discription;

  OnboardingModel({this.image, this.title, this.discription});
}

List<OnboardingModel> contents = [
  OnboardingModel(
      title: 'LetTutor',
      image: 'assets/onboarding/cover_1.png',
      discription:
          "English language teaching")
];
