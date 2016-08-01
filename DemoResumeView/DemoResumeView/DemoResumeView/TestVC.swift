//
//  TestVC.swift
//  DemoResumeView
//
//  Created by Ngo Thai on 8/2/16.
//  Copyright © 2016 TBLStudio. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    
    @IBOutlet weak var resumeView: ResumeView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        setupResumeViewContent()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Init info for ResumeView
    func setupResumeViewContent() {
        resumeView.resumeViewDelegate = self
        resumeView.coverImage.image = UIImage(named: "sea_background.jpg")
        //Setup cricle avatar
        resumeView.avatarImage.image = UIImage(named: "Mirandar-Kerr")
        resumeView.avatarImage.layer.masksToBounds = true
        resumeView.avatarImage.layer.cornerRadius = resumeView.avatarImage.frame.size.width / 2
        resumeView.nameLabel.text = "Mirandar Kerr"
        resumeView.titleLabel.text = "Model/Victoria's Secret"
        resumeView.locationLabel.text = "American"
        
        
        resumeView.personButton.setTitle("100k", forState: UIControlState.Normal)
        resumeView.likeButton.setTitle("143k", forState: UIControlState.Normal)
        resumeView.commentButton.setTitle("23k", forState: UIControlState.Normal)
    }
    

}

//MARK: - ResumeView Delegate
extension TestVC: ResumeViewDelegate {
    
    func resumeView(resumeView: ResumeView, onClickPersonButton personButton: UIButton) {
        print("onClickPersonButton")
    
    }
    func resumeView(resumeView: ResumeView, onClickCommentButton commentButton: UIButton) {
        print("onClickCommentButton")
    
    }
    func resumeView(resumeView: ResumeView, onClickLikeButton likeButton: UIButton) {
        print("onClickLikeButton")
    
    }

}
