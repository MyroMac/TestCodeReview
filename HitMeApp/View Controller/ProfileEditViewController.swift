//
//  ProfileEditViewController.swift
//  HitMeApp
//
//  Created by Mac on 08/03/22.
//

import UIKit
import MBCircularProgressBar
import Kingfisher

class ProfileEditViewController: UIViewController {

    //Mark:- Outlets
    @IBOutlet weak var backGroundIV: UIImageView!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var fireIV: UIImageView!
    @IBOutlet weak var levelNameLbl: UILabel!
    @IBOutlet weak var heartIV: UIImageView!
    @IBOutlet weak var heartLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var followerView: UIView!
    @IBOutlet weak var followerCountLbl: UILabel!
    @IBOutlet weak var fireWithGraphIV: UIImageView!
    @IBOutlet weak var fireWithGraphLbl: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var badgesCountLbl: UILabel!
    @IBOutlet weak var badgesTitleLbl: UILabel!
    @IBOutlet weak var breadIV: UIImageView!
    @IBOutlet weak var breadCountLbl: UILabel!
    @IBOutlet weak var breadTitleLbl: UILabel!
    @IBOutlet weak var giftIV: UIImageView!
    @IBOutlet weak var giftCountLbl: UILabel!
    @IBOutlet weak var starIV: UIImageView!
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet weak var dogIV: UIImageView!
    @IBOutlet weak var dogLbl: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var heightConstraintOfCollectionView: NSLayoutConstraint!
    @IBOutlet weak var levelIV: UIImageView!
    
    //Mark: - Variables
    let vm = ProfileEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewUI()
        setLabelUI()
        setLabelViewModel()
        setButtonUI()
        setImageViewUI()
        setImageViewMiddleView()
        setUpCollectionView()
        callGetUserDetail()
       
    }
    
    func setButtonUI() {
        self.messageBtn.setButtonImage(Constants.Design.Image.messageBox)
        self.settingBtn.setButtonImage(Constants.Design.Image.setting)
    }
    
    func setImageViewUI() {
        self.fireIV.setImageView(image: Constants.Design.Image.fire)
        self.heartIV.setImageView(image: Constants.Design.Image.heart)
        self.fireWithGraphIV.setImageView(image: Constants.Design.Image.fireWithGraph)
        self.breadIV.setImageView(image: Constants.Design.Image.bread)
        
    }
    
    func setImageViewMiddleView() {
        self.giftIV.setImageView(image: Constants.Design.Image.gift)
        self.starIV.setImageView(image: Constants.Design.Image.star)
        self.dogIV.setImageView(image: Constants.Design.Image.dog)
        self.backGroundIV.setImageView(image: Constants.Design.Image.profileEditBackground)
        self.profileIV.setImageViewLayer(profileIV.frame.height / 2, borderColor: .clear, borderWidth: 0)
        self.levelIV.setImageView(image: Constants.Design.Image.circle_count)
    }
    
    func setLabelUI() {
        self.levelNameLbl.withManropeMediumFont(text: Constants.Text.Super_streaker)
        self.heartLbl.withManropeMediumFont(text: Constants.Text.Glammed)
        self.followerCountLbl.with(text: Constants.Text.followerCount, font: UIFont(name: Constants.Design.Font.ManropeRegular, size: Constants.Design.FontSize.profileViewFontSize13)!, alignment: .center)
        self.badgesCountLbl.withManropeBoldFont(text: Constants.Text.badgesCount, alignment: .center)
        self.breadCountLbl.withManropeBoldFont(text: Constants.Text.breadCount, alignment: .center)
       
    }
    
    func setLabelViewModel() {
        vm.setLabel(label: fireWithGraphLbl, text: Constants.Text.Day_Streak)
        vm.setLabel(label: badgesTitleLbl, text: Constants.Text.Badges)
        vm.setLabel(label: breadTitleLbl, text: Constants.Text.bread)
        vm.setLabel(label: giftCountLbl, text: Constants.Text.five)
        vm.setLabel(label: starLbl, text: Constants.Text.Double_XP)
        vm.setLabel(label: dogLbl, text: Constants.Text.Dog_House)
    }
    
    func setViewUI() {
        self.followerView.setViewLayer(Constants.CornerRadius.cornerRadius)
        self.followerView.setViewBackgroundColor(Constants.Design.Color.grey)
        self.middleView.setViewLayer(Constants.CornerRadius.cornerRadius20)
        self.middleView.dropShadow(color: Constants.Design.Color.grey, offSet: CGSize(width: -1, height: 1))
        self.middleView.setViewBackgroundColor(Constants.Design.Color.white)
        setProgressBar()
        
    }
    func setProgressBar() {
        self.progressBar.setViewBackgroundColor(Constants.Design.Color.white)
        self.progressBar.value = 90.0
        self.progressBar.showValueString = false
        self.progressBar.emptyLineWidth = 0.0
        self.progressBar.progressAngle = 65
        self.progressBar.progressColor = Constants.Design.Color.yellow
        self.progressBar.progressStrokeColor = Constants.Design.Color.yellow
        self.progressBar.progressLineWidth = 12
    }
    
}

