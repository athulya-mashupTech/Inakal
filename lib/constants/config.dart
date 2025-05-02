//Base URL for all API calls
const baseUrl = "https://enakal.com/api/";

//API endpoints

//Login and Registration
const loginUrl = "${baseUrl}login";
const registerUrl = "${baseUrl}register";

//User Profile
const userProfileUrl = "${baseUrl}userProfile";

//Counsellors Page
const allDoctorsUrl = "${baseUrl}doctors";
const bookAppointmentUrl = "${baseUrl}bookAppointment";

//Profile Completion Status
const profileCompletionStatusUrl = "${baseUrl}profileCompletionStatus";

//Request Listing API's
const receivedRequestsUrl = "${baseUrl}receivedRequest";
const sentRequestsUrl = "${baseUrl}sentRequests";
const userDetailsFetchUrl = "${baseUrl}get_user_data";
const deleteRequestUrl = "${baseUrl}deleteRequest";

//Gallery API's
const galleryImagesUrl = "${baseUrl}userGallery";

// User data update API's
const userProfileUpdateUrl = "${baseUrl}updateProfileDetails";
const userPersonalUpdateUrl = "${baseUrl}updatePersonalDetails";
const userEduProfUpdateUrl = "${baseUrl}updateEduProfDetails";
const userFamilyUpdateUrl = "${baseUrl}updateFamilyDetails";
const userLocationUpdateUrl = "${baseUrl}updateLocationDetails";
const userPreferenceUpdateUrl = "${baseUrl}updatePartnerPrefs";
const userAdditionalDetailUpdateUrl = "${baseUrl}updateAdditionalDetails";

// Other Profile API's
const otherProfileUrl = "${baseUrl}get_user_data"; //otherUserDetails
const sendInterestUrl = "${baseUrl}sendInterest";