abstract class ReviewStates{}

class InitialReview extends ReviewStates{}

class LoadingPickReviewImage extends ReviewStates{}
class SuccessPickReviewImage extends ReviewStates{}
class FailurePickReviewImage extends ReviewStates{}

class LoadingUploadReviewImage extends ReviewStates{}
class SuccessUploadReviewImage extends ReviewStates{}
class FailureUploadReviewImage extends ReviewStates{}

class LoadingAddReview extends ReviewStates{}
class SuccessAddReview extends ReviewStates{}
class FailureAddReview extends ReviewStates{}

class LoadingGetReviews extends ReviewStates{}
class SuccessGetReviews extends ReviewStates{}
class FailureGetReviews extends ReviewStates{}

class LoadingLike extends ReviewStates{}
class SuccessLikeIncrease extends ReviewStates{}
class SuccessLikeDecrease extends ReviewStates{}
class FailureLike extends ReviewStates{}

class LoadingGetCarCenterReviews extends ReviewStates{}
class SuccessGetCarCenterReviews extends ReviewStates{}
class FailureGetCarCenterReviews extends ReviewStates{}

class ChangeRateValue extends ReviewStates{}


