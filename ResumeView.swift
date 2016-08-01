//
//  ResumeView.swift
//  FlatUIElements
//
//  Created by Thái Bô Lão on 7/29/16.
//  Copyright © 2016 TBLStudio. All rights reserved.
//

import UIKit

protocol ResumeViewDelegate: class {
    func resumeView(resumeView: ResumeView, onClickPersonButton personButton: UIButton)
    func resumeView(resumeView: ResumeView, onClickCommentButton commentButton: UIButton)
    func resumeView(resumeView: ResumeView, onClickLikeButton likeButton: UIButton)

}

@IBDesignable
class ResumeView: UIView {
    
    // MARK: - CONSTANTS
    let nibName = "ResumeView"
    
    // MARK: - OUTLETS
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var personButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    //MARK: - @IBInspectable
    @IBInspectable var mCoverImage: UIImage = UIImage() {
        didSet {
            //self.coverImage.image = mCoverImage
        }
    }
    
    // MARK: - VARIABLES
    var view: UIView!
    var resumeViewDelegate: ResumeViewDelegate?
    
    
    // MARK: - INITIALIZATION
    override init(frame: CGRect) {
        // 1. setup any properties here
        // 2. call super.init(frame:)
        super.init(frame: frame)
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let view: UIView = bundle.loadNibNamed(nibName, owner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        return view
    }
    
    //MARK:- Button's Action
    @IBAction func personButtonPressed(sender: AnyObject) {
        resumeViewDelegate?.resumeView(self, onClickPersonButton: sender as! UIButton)
    }
    @IBAction func commentButtonPressed(sender: AnyObject) {
        resumeViewDelegate?.resumeView(self, onClickCommentButton: sender as! UIButton)
    }
    @IBAction func likeButtonPressed(sender: AnyObject) {
        resumeViewDelegate?.resumeView(self, onClickLikeButton: sender as! UIButton)
    }
    

}
