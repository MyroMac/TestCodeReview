//
//  GlobalConstant.swift
//  HitMeApp
//
//  Created by Mac on 04/03/22.
//

import Foundation
import UIKit

struct Constants {
    
    struct AppInfo{
        static let appName: String = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String) ?? ""
        static let screenWidth = Int(UIScreen.main.bounds.width)
    }
    
    struct Design {
        
        static var button = UIButton()
        
        struct Color {
            static let yellow = UIColor(named: "yellowColor")!
            static let black = UIColor(named: "blackColor")!
            static let white = UIColor(named: "whiteColor")!
            static let grey = UIColor(named: "nextButtonGrayColor")!
            static let nextButtonTitleDarkGrayColor = UIColor(named: "nextButtonTextColor")!
            
        }
        
        struct Font {
            static let ManropeRegular = "Manrope-Regular"
            static let ManropeExtraLight = "Manrope-ExtraLight"
            static let ManropeLight = "Manrope-Light"
            static let ManropeMedium = "Manrope-Medium"
            static let ManropeSemiBold = "Manrope-SemiBold"
            static let ManropeBold = "Manrope-Bold"
            static let ManropeExtraBold = "Manrope-ExtraBold"
            static let SFProTextLight = "SFProText-Light"
        }
        
        struct Image {
            static let landingScreenBackgroundImage = UIImage (named: "landingScreenBackground")!
            static let facebook = UIImage (named: "facebook")!
            static let twitter = UIImage (named: "twitter")!
            static let instagram = UIImage (named: "instagram")!
            static let phone = UIImage (named: "phone")!
            static let back = UIImage (named: "back")!
            static let phoneNumberScreenBackgroundImage = UIImage (named: "phoneNumberScreenBg")!
            static let profileScreenBackgroundImage = UIImage (named: "profileScreenBg")!
            static let defaultPicture = UIImage (named: "defaultPic")!
            static let tick = UIImage (named: "tickyellow")!
            static let bread = UIImage (named: "bread")!
            static let dog = UIImage (named: "dog")!
            static let fire = UIImage (named: "fire")!
            static let fireWithGraph = UIImage (named: "firewithgraph")!
            static let gift = UIImage (named: "gift")!
            static let setting = UIImage (named: "setting")!
            static let star = UIImage (named: "star")!
            static let heart = UIImage (named: "heart")!
            static let profileEditBackground = UIImage (named: "profileEditBackground")!
            static let circle_count = UIImage (named: "circle_count")!
            static let messageBox = UIImage (named: "messageBox")!
        }
        
        struct FontSize {
            /// 88
            static let BigTitle: CGFloat = 75
            /// 18
            static let Subtitle: CGFloat = 18
            /// 16
            static let joinSquad: CGFloat = 16
            /// 25
            static let phoneNumberScreenTitle: CGFloat = 25
            
            static let profileViewFontSize13: CGFloat = 13
        }
        
        struct ImagesCollections {
            static let images = [UIImage (named: "pic1")!, UIImage (named: "pic2")!, UIImage (named: "pic3")!, UIImage (named: "pic1")!, UIImage (named: "pic2")!, UIImage (named: "pic3")!,UIImage (named: "pic1")!, UIImage (named: "pic2")!, UIImage (named: "pic3")!,UIImage (named: "pic1")!, UIImage (named: "pic2")!, UIImage (named: "pic3")!]
        }
    }
    
    
    struct Text {
        static let SignIn = "Login"
        static let landingScreenTitle = "IT’S LIT IN HERE"
        static let landingScreenSubtitle = "DM, post, explore, bust your bae, level up, gift and other dank shit."
        static let joinSquad = "JOIN THE SQUAD"
        static let phoneNumberScreenTitle = "NEW NUMBER, WHO THIS?"
        static let phoneNumberPlaceHolder = "000 000 0000"
        static let codePlaceHolder = "000000"
        static let next = "Next"
        static let codeScreenTitle = "PROVE IT, ENTER THE CODE."
        static let profileScreenTitle = "DOPE, YOU’RE LEGIT.\nBUT WHO ARE YOU?"
        static let userNamePlaceholder = "Username"
        static let firstNamePlaceholder = "First Name"
        static let lastNamePlaceholder = "Last Name"
        static let imageSelectionMessage = "Select image to uploading profile picture"
        static let imageActionSheetTitle = "Image upload"
        static let cancel = "Cancel"
        static let takePhoto = "Take Photo"
        static let chooseImage = "Choose Photo"
        static let logout = "Log Out"
        static let Super_streaker = "SUPER STREAKER"
        static let Glammed = "GLAMMED"
        static let followerCount = "200 Followers"
        static let Day_Streak = "Day Streak"
        static let Badges = "Badges"
        static let bread = "Bread"
        static let five = "5"
        static let Double_XP = "Double XP"
        static let Dog_House = "Dog House"
        static let badgesCount = "2/30"
        static let breadCount = "25"
        
        
    }
    struct AlertMessages {
        static let UnderDevelopement = "It is under development"
        static let enterValidNumber = "Please enter valid number"
        static let userSuccessfullyLogin = "Login Successfully"
        static let userSuccessfullyRegister = "Register Successfully"
        static let profileUpdate = "Profile Updated succesfully"
        static let enteruserName = "Please enter username"
        static let firstName = "Please enter first name"
        static let lastName = "Please enter last name"
        static let selectImage = "Please select image"
    }
    struct maxDigits {
        static let phoneNumbermaxDigits = 10
    }
    struct DateFormat {
        static let format = "YY/dd/MM/HH:mm:ss"
    }
    struct DatabaseCollections {
        static let user = "users"
        static let profilePicStore = "userProfilePicture"
    }
    
    struct Padding {
        static let padding = 10.0
    }
    
    struct CornerRadius {
        static let cornerRadius = 10.0
        static let cornerRadius20 = 30.0
    }
    
    
}
enum StoryBoardType: String {
    case main = "Main"
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
