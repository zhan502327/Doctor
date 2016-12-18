//
//  IWCommon.h
//  Doctor
//
//  Created by 范超 on 16/12/17.
//
//

#ifndef IWCommon_h
#define IWCommon_h

// 0.URL
#define SERVER_URL @"http://114.55.25.162:7070/"
#define SERVER_BASE_URL           ([SERVER_URL stringByAppendingString:@"V0102/"])
#define SERVER_BASE_URL1           ([SERVER_URL stringByAppendingString:@"Common/"])

#define SERVER_VIEW_DETAIL       ([SERVER_BASE_URL stringByAppendingString:@"ViewDetail/viewDetail.html?type=%@&id=%@&companyId=%ld&loginId=%@"])
#define SERVER_GET_HOME_DISPLAY            ([SERVER_BASE_URL stringByAppendingString:@"GetHomeDisplayList/2J.do"])
#define SERVER_GET_VERSION            ([SERVER_BASE_URL stringByAppendingString:@"GetVersion/2J.do"])
#define SERVER_LOGIN_URL            ([SERVER_BASE_URL stringByAppendingString:@"DoLogin/2J.do"])
#define SERVER_REGISTER_SC_URL      ([SERVER_BASE_URL stringByAppendingString:@"GetRegisterSc/2J.do"])
#define SERVER_REGISTER_URL         ([SERVER_BASE_URL stringByAppendingString:@"DoRegister/2J.do"])
#define SERVER_HOME_NEWS_LIST_URL   ([SERVER_BASE_URL stringByAppendingString:@"GetTravorNewsList/2J.do"])
#define SERVER_HOME_NEWS_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetTravorNewsDetail/2J.do"])
#define SERVER_RELATE_COMPANY_URL    ([SERVER_BASE_URL stringByAppendingString:@"GetNNPList/2J.do"])
#define SERVER_COMPANY_NEWS_LIST_URL      ([SERVER_BASE_URL stringByAppendingString:@"GetNewsList/2J.do"])
#define SERVER_COMPANY_NEWS_DETAIL_URL    ([SERVER_BASE_URL stringByAppendingString:@"GetNewsDetail/2J.do"])
#define SERVER_COMPANY_NOTICE_LIST_URL    ([SERVER_BASE_URL stringByAppendingString:@"GetNoticeList/2J.do"])
#define SERVER_COMPANY_NOTICE_DETAIL_URL  ([SERVER_BASE_URL stringByAppendingString:@"GetNoticeDetail/2J.do"])
#define SERVER_COMPANY_POLICY_LIST_URL    ([SERVER_BASE_URL stringByAppendingString:@"GetPolicyList/2J.do"])
#define SERVER_COMPANY_VOTE_LIST_URL    ([SERVER_BASE_URL stringByAppendingString:@"GetVoteList/2J.do"])
#define SERVER_COMPANY_POLICY_DETAIL_URL  ([SERVER_BASE_URL stringByAppendingString:@"GetPolicyDetail/2J.do"])
#define SERVER_FANS_URL                   ([SERVER_BASE_URL stringByAppendingString:@"GetFans/2J.do"])
#define SERVER_CHANGE_FANS_URL     ([SERVER_BASE_URL stringByAppendingString:@"DoChangeFan/2J.do"])
#define SERVER_COMPANY_FEEDBACK_LIST_URL   ([SERVER_BASE_URL stringByAppendingString:@"GetFeedbackList/2J.do"])
#define SERVER_COMPANY_FEEDBACK_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetFeedbackDetail/2J.do"])
#define SERVER_COMPANY_FEEDBACK_SUBMIT_URL   ([SERVER_BASE_URL stringByAppendingString:@"SubmitFeedback/2J.do"])
#define SERVER_COMPANY_QUESTION_LIST_URL   ([SERVER_BASE_URL stringByAppendingString:@"GetQuestionnaireList/2J.do"])
#define SERVER_COMPANY_QUESTION_DETAIL_URL   ([SERVER_BASE_URL stringByAppendingString:@"GetQuestionnaireDetail/view.html"])
#define SERVER_CHANGE_PASSWORD_URL    ([SERVER_BASE_URL stringByAppendingString:@"DoChangePwd/2J.do"])
#define SERVER_FIND_PASSWORD_EMAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"DoResetPwdByMail/2J.do"])
#define SERVER_FIND_PASSWORD_ANSWER_URL ([SERVER_BASE_URL stringByAppendingString:@"DoResetPwdBySQ/2J.do"])
#define SERVER_GET_PASSWORD_SC_URL ([SERVER_BASE_URL stringByAppendingString:@"GetResetPwdSc/2J.do"])
#define SERVER_GET_RESET_PASSWORD_SC_URL ([SERVER_BASE_URL stringByAppendingString:@"GetResetCellphoneSc/2J.do"])
#define SERVER_FIND_PASSWORD_CELLPHONE_URL ([SERVER_BASE_URL stringByAppendingString:@"DoResetPwd/2J.do"])
#define SERVER_CHANGE_USER_URL ([SERVER_BASE_URL stringByAppendingString:@"DoChangeInfo/2J.do"])
#define SERVER_CONTACT_URL ([SERVER_BASE_URL stringByAppendingString:@"GetContact/2J.do"])
#define SERVER_CHANGE_CELLPHONE_URL ([SERVER_BASE_URL stringByAppendingString:@"DoResetCellphone/2J.do"])
#define SERVER_TRAVOR_NEWS_PHOTO_URL ([SERVER_BASE_URL stringByAppendingString:@"GetTravorNewsPhoto/2J.do"])
#define SERVER_PERSON_INFO_URL ([SERVER_BASE_URL stringByAppendingString:@"GetInfo/2J.do"])
#define SERVER_NOTICE_APPLY_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNoticeJoin/2J.do"])
#define SERVER_NEWS_KNOWN_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNewsKnown/2J.do"])
#define SERVER_NOTICE_KNOWN_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNoticeKnown/2J.do"])
#define SERVER_POLICY_KNOWN_URL    ([SERVER_BASE_URL stringByAppendingString:@"DoPolicyKnown/2J.do"])

#define SERVER_NEWS_SIGNUP_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNewsPraize/2J.do"])
#define SERVER_NOTICE_SIGNUP_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNoticePraize/2J.do"])
#define SERVER_POLICY_SIGNUP_URL ([SERVER_BASE_URL stringByAppendingString:@"DoPolicyPraize/2J.do"])
#define SERVER_NEWS_COMMENT_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNewsReview/2J.do"])
#define SERVER_NOTICE_COMMENT_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNoticeReview/2J.do"])
#define SERVER_POLICY_COMMENT_URL ([SERVER_BASE_URL stringByAppendingString:@"DoPolicyReview/2J.do"])
#define SERVER_ME_NOTIFICATION_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetNotificationList/2J.do"])
#define SERVER_ME_NOTIFICATION_KNOWN_URL ([SERVER_BASE_URL stringByAppendingString:@"DoNotificationKnown/2J.do"])

#define SERVER_GET_ADDRESS_URL @"http://conedot.com:7070/Common/GetRegion/2J.do"

#define SERVER_GET_COMMON_CONTACT_URL ([SERVER_BASE_URL stringByAppendingString:@"GetCommonContact/2J.do"])
#define SERVER_GET_CONTACT_WITH_LEVEL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetContactWithLevel/2J.do"])

// Help Feedback
#define SERVER_GET_TRAVOR_FEEDBACK_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetTravorFeedbackList/2J.do"])
#define SERVER_GET_TRAVOR_FEEDBACK_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetTravorFeedbackDetail/2J.do"])
#define SERVER_SUBMIT_TRAVOR_FEEDBACK_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitTravorFeedback/2J.do"])


#define SERVER_SUBMIT_SIGN_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitSign/2J.do"])
#define SERVER_GET_SIGN_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetSignList/2J.do"])
#define SERVER_GET_COMMON_CONTACT_URL ([SERVER_BASE_URL stringByAppendingString:@"GetCommonContact/2J.do"])
#define SERVER_GET_SHARE_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetShareList/2J.do"])
#define SERVER_SUBMIT_SHARE_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitShare/2J.do"])
#define SERVER_GET_SHARE_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetShareDetail/2J.do"])
#define SERVER_GET_PUBLISHED_SHARE_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetPublishedShareList/2J.do"])
#define SERVER_DO_SHUTDOWN_SHARE_URL ([SERVER_BASE_URL stringByAppendingString:@"DoShutDownShare/2J.do"])
#define SERVER_COMPANY_MOVEMENT_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetActivityList/2J.do"])
#define SERVER_DO_ACTIVITY_KEY_READ_URL ([SERVER_BASE_URL stringByAppendingString:@"DoActivityKeyRead/2J.do"])
#define SERVER_GET_ACTIVITY_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetActivityDetail/2J.do"])
#define SERVER_DO_ACTIVITY_JOIN_URL ([SERVER_BASE_URL stringByAppendingString:@"DoActivityJoin/2J.do"])
#define SERVER_DO_ACTIVITY_KNOWN_URL ([SERVER_BASE_URL stringByAppendingString:@"DoActivityKnown/2J.do"])
#define SERVER_DO_ACTIVITY_PRAIZE_URL ([SERVER_BASE_URL stringByAppendingString:@"DoActivityPraize/2J.do"])
#define SERVER_DO_ACTIVITY_REVIEW_URL ([SERVER_BASE_URL stringByAppendingString:@"DoActivityReview/2J.do"])
#define SERVER_GET_LEARN_TASK_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetLearnTaskList/2J.do"])
#define SERVER_GET_LEARN_TASK_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetLearnTaskDetail/2J.do"])
#define SERVER_DO_LEARN_TASK_LEARNED_URL ([SERVER_BASE_URL stringByAppendingString:@"DoLearnTaskLearned/2J.do"])
#define SERVER_GET_REPORT_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetReportList/2J.do"])
#define SERVER_GET_REPORTED_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetReportedList/2J.do"])
#define SERVER_GET_REPORT_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetReportDetail/view.html?id=%1$s&userId=%2$s&type=%3$s"])
#define SERVER_GET_APPROVAL_COPY_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetCcList/2J.do"])

#define SERVER_GET_TRAIN_CLASS_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetTrainClassList/2J.do"])
#define SERVER_JOIN_OR_REFUSE_TRAIN_CLASS_URL ([SERVER_BASE_URL stringByAppendingString:@"JoinOrRefuseTrainClass/2J.do"])
#define SERVER_GET_TRAINNING_COURSE_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"TrainClass/viewClass.html?id=%1$s&companyId=%2$s&loginId=%3$s"])
#define SERVER_GET_AGREE_ILLUSTRATION_URL = SERVER_ROOT + "/agree/illustration.html"])
#define SERVER_GET_VIEW_DOCTORINFO_URL ([SERVER_BASE_URL stringByAppendingString:@"ViewDoctorInfo/viewDoctorInfo.html?loginId=%1$s"])

#define SERVER_GET_VIEW_AGREEMENT_URL ([SERVER_BASE_URL stringByAppendingString:@"ViewAgreement/viewAgreement.html?loginId=%1$s"])
#define SERVER_GET_GET_INQUIRY_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetInquiryList/2J.do"])
#define SERVER_GET_GET_INQUIRY_MEMBER_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetInquiryMemberList/2J.do"])
#define SERVER_DO_DELETE_INQUIRY_MEMBER_URL ([SERVER_BASE_URL stringByAppendingString:@"DoDeleteInquiryMember/2J.do"])
#define SERVER_SUBMIT_INQUIRY_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitInquiry/2J.do"])
#define SERVER_DO_EDIT_INQUIRY_MEMBER_URL ([SERVER_BASE_URL stringByAppendingString:@"DoEditInquiryMember/2J.do"])
#define SERVER_GET_INQUIRY_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetInquiryDetail/2J.do"])
#define SERVER_GET_INQUIRY_MEMBER_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetInquiryMemberDetail/2J.do"])
#define SERVER_GET_COMMUNITY_HOSPITAL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetCommunityHospital/2J.do"])
#define SERVER_GET_HOSPITAL_CONTACT_URL ([SERVER_BASE_URL stringByAppendingString:@"GetHospitalContact/2J.do"])
#define SERVER_GET_MEDICAL_INFO_URL ([SERVER_BASE_URL stringByAppendingString:@"health/my/myMedicalInfo.html?loginId=%1$s"])
#define SERVER_GET_LOGIN_INFO_URL ([SERVER_BASE_URL stringByAppendingString:@"GetLoginInfo/2J.do"])
#define SERVER_GET_GET_MEMBER_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetMemberList/2J.do"])
#define SERVER_SUBMIT_DISEASE_REPORT_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitDiseaseReport/2J.do"])

#define SERVER_GET_DISEASE_REPORT_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetDiseaseReportList/2J.do"])
#define SERVER_DO_DELETE_DISEASE_REPORT_URL ([SERVER_BASE_URL stringByAppendingString:@"DoDeleteDiseaseReport/2J.do"])
#define SERVER_GET_DISEASE_REPORT_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetDiseaseReportDetail/2J.do"])
#define SERVER_GET_BLOOD_PRESSURE_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetBloodPressureList/2J.do"])
#define SERVER_GET_BLOOD_SUGAR_LIST_URL ([SERVER_BASE_URL stringByAppendingString:@"GetBloodSugarList/2J.do"])
#define SERVER_SUBMIT_BLOODPRESSURE_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitBloodPressure/2J.do"])
#define SERVER_SUBMIT_BLOODSUGAR_URL ([SERVER_BASE_URL stringByAppendingString:@"SubmitBloodSugar/2J.do"])
#define SERVER_DO_DELETE_BLOOD_PRESSURE_URL ([SERVER_BASE_URL stringByAppendingString:@"DoDeleteBloodPressure/2J.do"])
#define SERVER_DO_DELETE_BLOOD_SUGAR_URL ([SERVER_BASE_URL stringByAppendingString:@"DoDeleteBloodSugar/2J.do"])
#define SERVER_GET_BLOOD_PRESSURE_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetBloodPressureDetail/2J.do"])
#define SERVER_GET_LASTED_BLOOD_PRESSURE_URL ([SERVER_BASE_URL stringByAppendingString:@"GetLastedBloodPressure/2J.do"])
#define SERVER_GET_BLOOD_SUGAR_DETAIL_URL ([SERVER_BASE_URL stringByAppendingString:@"GetBloodSugarDetail/2J.do"])
#define SERVER_GET_LASTED_BLOOD_SUGAR_URL ([SERVER_BASE_URL stringByAppendingString:@"GetLastedBloodSugar/2J.do"])
#define SERVER_DO_SUBMIT_MEMBER_INFO_URL ([SERVER_BASE_URL stringByAppendingString:@"DoSubmitMemberInfo/2J.do"])
#define SERVER_DO_DELETE_MEMBER_URL ([SERVER_BASE_URL stringByAppendingString:@"DoDeleteMember/2J.do"])
#define SERVER_DO_ASSESS_INQUIRY_DOCTOR_URL ([SERVER_BASE_URL stringByAppendingString:@"DoAssessInquiryDoctor/2J.do"])

#define SERVER_BLOODPRESSURE_1_URL = SERVER_ROOT + "/bloodpressure/illustration1.html"])
#define SERVER_BLOODPRESSURE_2_URL = SERVER_ROOT + "/bloodpressure/illustration2.html"])
#define SERVER_BLOODPRESSURE_3_URL = SERVER_ROOT + "/bloodpressure/illustration3.html"])
#define SERVER_BLOODPRESSURE_4_URL = SERVER_ROOT + "/bloodsugar/illustration4.html"])
#define SERVER_BLOODSUGAR_1_URL = SERVER_ROOT + "/bloodpressure/illustration1.html"])
#define SERVER_BLOODSUGAR_2_URL = SERVER_ROOT + "/bloodpressure/illustration2.html"])
#define SERVER_BLOODSUGAR_3_URL = SERVER_ROOT + "/bloodpressure/illustration3.html"])
#define SERVER_BLOODSUGAR_4_URL = SERVER_ROOT + "/bloodpressure/illustration4.html"])

// Number
#define IWPAGESIZE 10
#define IWTIMECOUNT 59

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.Color
#define IWMainBgColor IWColor(236, 236, 237)
#define IWTableViewBgColor IWColor(226, 226, 226)
#define IWGlobalColor IWColor(104, 184, 164)
#define IWLoadingColor IWColor(104, 184, 164)
#define IWColor(r, g, b) IWColorWithAlpha(r, g, b, 1)
#define IWColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define IWColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// Background
#define IWLoginBg [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]]
#define IWGlobalBg [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]]


// 3.自定义Log
#ifdef DEBUG
#define IWLog(...) NSLog(__VA_ARGS__)
#else
#define IWLog(...)
#endif

// 4.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 5.Conedot的属性


// 6.常用的对象
#define IWNotificationCenter [NSNotificationCenter defaultCenter]
#define IWUserDefaults [NSUserDefaults standardUserDefaults]

// 7.常量
#define IWTableBorderW  6
#define IWCellMargin  6
#define IWCompanyId 101915
#define IWAppID @"903699222"
#define UMENG_APPKEY @"54c9a077fd98c51539000810"
#define IWQQAppID @"1101475104"
#define IWQQAppSecret @"tr0Hxq86fPOf4oYP"
#define IWWeiXinAppID @"wxc580418c035487e7"
#define IWWeiXinAppSecret @"3348c14132299398791b00d913b49bc3"
#define IWAmapKey @"758bb44a3ed7a8105965382909bd05e8"

#define kGtAppId           @"MwlyEJUxej6qAULN26v9M8"
#define kGtAppKey          @"QuxAE6ymoB8xl9vaDYMV68"
#define kGtAppSecret       @"v4wwA5axrF694IyjDC2zl7"

// 8.UserDefault
#define UserDefaultCompanyId @"companyId"
#define UserDefaultContactHeaderTitle @"UserDefaultContactHeaderTitle"
#define UserDefaultContactApprovalUserId @"UserDefaultContactApprovalUserId"
#define UserDefaultContactApprovalUserName @"UserDefaultContactApprovalUserName"
#define UserDefaultContactApprovalHidden @"UserDefaultContactApprovalHidden"
#define UserDefaultSignTime @"UserDefaultSignTime"

// 招聘详情中的字体
#define IWRecruitDetailTitleFont [UIFont systemFontOfSize:15]
#define IWRecruitDetailOtherFont [UIFont systemFontOfSize:14]
#define IWRecruitDetailButtonFont [UIFont systemFontOfSize:16]

// 我的问详情中的字体
#define IWMyQuestionDetailTitleFont [UIFont systemFontOfSize:15]
#define IWMyQuestionDetailOtherFont [UIFont systemFontOfSize:14]

// 通知
// 推送的通知
#define IWRemotionNotification @"IWRemotionNotification"
#define IWRemotionActiveNotification @"IWRemotionActiveNotification"
#define IWRemotionPushNotification @"IWRemotionPushNotification"
#define IWRemotionPushCompany @"IWRemotionPushCompany"

// 图片点击的通知
#define IWHomeClickNotification @"IWHomeClickNotification"
#define IWHomeClickNotificationBanner @"IWHomeClickNotificationBanner"

#endif