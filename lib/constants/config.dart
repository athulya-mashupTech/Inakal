//Base URL for all API calls
const baseUrl = "https://inakal.com/api/";
const authBaseUrl = "https://inakal.com/authapi/";

//Base URL for web
const baseUrlWeb = "https://enakal.com/";

//WebView Endpoints
const aboutUsUrl = "${baseUrlWeb}about-us";
const TermsAndConditionsUrl = "${baseUrlWeb}terms";

//API endpoints

// Helper APIs for Registration
const getAllDropdownOptionsUrl = "${authBaseUrl}getAllDropDownOptions";
const getSearchedDistrictsUrl = "${authBaseUrl}searchDistrict";
const getCasteSubcastesUrl = "${authBaseUrl}getReligionCasteAndSubcaste";

//Login and Registration
const loginUrl = "${authBaseUrl}login";
const registerUrl = "${authBaseUrl}register";
const sentOtpUrl = "${authBaseUrl}sendOtp";
const verifyOtpUrl = "${authBaseUrl}verifyLoginOtp";

//User Profile
const userProfileUrl = "${baseUrl}userProfile";

//Counsellors Page
const allDoctorsUrl = "${baseUrl}doctors";
const bookAppointmentUrl = "${baseUrl}bookAppointment";
const checkAppointmentUrl = "${baseUrl}checkDoctorAppointment";

//Profile Completion Status
const profileCompletionStatusUrl = "${baseUrl}profileCompletionStatus";

//Request Listing API's
const receivedRequestsUrl = "${baseUrl}receivedRequest";
const sentRequestsUrl = "${baseUrl}sentRequests";
const userDetailsFetchUrl = "${baseUrl}get_user_data";
const deleteRequestUrl = "${baseUrl}deleteRequest";

//Gallery API's
const galleryImagesUrl = "${baseUrl}userGallery";
const updateGalleryImageUrl = "${baseUrl}uploadGalleryImage";
const deleteGalleryImageUrl = "${baseUrl}deleteGalleryImage";

//filter API's
const filterProfileUrl = "${baseUrl}manualFilter";

// User data update API's
const userProfileImageUrl = "${baseUrl}updateProfilePic";
const userProfileUpdateUrl = "${baseUrl}updateProfileDetails";
const userPersonalUpdateUrl = "${baseUrl}updatePersonalDetails";
const userEduProfUpdateUrl = "${baseUrl}updateEduProfDetails";
const userFamilyUpdateUrl = "${baseUrl}updateFamilyDetails";
const userLocationUpdateUrl = "${baseUrl}updateLocationDetails";
const userPreferenceUpdateUrl = "${baseUrl}updatePartnerPrefs";
const userAdditionalDetailUpdateUrl = "${baseUrl}updateAdditionalDetails";

const getCasteAndSubcasteOptionsUrl = "${baseUrl}getReligionCasteAndSubcaste";
const getQualificationOptionsUrl = "${baseUrl}getQualificationsByEducation";


// Dropdown Values Fetching Api
const dropdownOptionsUrl = "${baseUrl}getDropDownOptions";

// Other Profile API's
const otherProfileUrl = "${baseUrl}get_user_data"; //otherUserDetails
const sendInterestUrl = "${baseUrl}sendInterest";
const toggelLikedbyUrl = "${baseUrl}toggelLikedby";
const getRequestStatusUrl = "${baseUrl}getRequestStatus";
const acceptRequestUrl = "${baseUrl}acceptRequest";
const rejectRequestUrl = "${baseUrl}rejectRequest";

//Related Profile API's
const relatedProfileUrl = "${baseUrl}relatedProfiles";
const likedProfileUrl = "${baseUrl}getLikedProfiles";

//Mobile Number Verification API's
const mobileNumberCheckUrl = "${authBaseUrl}checkMobileNumberExists";

// Inbox Test API
const inboxTestUrl = "https://mocki.io/v1/9d3b40d5-d3a9-4db9-867b-34d786ae09ed";

