abstract class ReviewStates{}

class InitialReview extends ReviewStates{}

class LoadingPickReviewImage extends ReviewStates{}
class SuccessPickReviewImage extends ReviewStates{}
class FailurePickReviewImage extends ReviewStates{}

class LoadingUploadReviewImage extends ReviewStates{}
class SuccessUploadReviewImage extends ReviewStates{}
class FailureUploadReviewImage extends ReviewStates{}
