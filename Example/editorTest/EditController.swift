//
//  EditController.swift
//  editorTest
//
//  Created by Le Cuong on 12/24/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit
import SDWebImage
import iOSPhotoEditor

class EditController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PhotoEditorDelegate {
	// MARK: - PhotoEditorDelegate
	func doneEditing(image: UIImage) {
		let degsignDoneImage = UIImageView(frame:designImage.bounds);
		degsignDoneImage.image = image;
		designImage.addSubview(degsignDoneImage);
	}
	
	func canceledEditing() {
		print("Canceled")
	}
	
	// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == themesCollection {
			return lstThemes.count;
		} else {
			return lstEffect.count;
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierThemes, for: indexPath);
		cell.backgroundColor = UIColor.red;
		return cell;
	}
	
	fileprivate let reuseIdentifierThemes = "identifierThemes"
	

	@IBOutlet weak var originImage: UIImageView!
	@IBOutlet weak var themesCollection: UICollectionView!
	@IBOutlet weak var effectCollection: UICollectionView!
	@IBOutlet weak var designImage: UIView!
	
	var originImageUrl:String!
	var lstThemes: NSArray!
	var lstEffect: NSArray!
	var tapShowEdit:UITapGestureRecognizer!
	
	
	class func create() -> EditController {
		let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
		return mainStoryboard.instantiateViewController(withIdentifier: String(describing: self)) as! EditController
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//set border cho khung hình thiết kế.
		designImage.layer.borderWidth = 1;
		designImage.layer.borderColor = UIColor.init(red:220/255.0 , green:220/255.0 , blue:220/255.0 , alpha:1.0).cgColor;
		
        // load anh từ web vào.
//		originImage.sd_setImage(with: URL(string: originImageUrl), placeholderImage: UIImage(named : "ao1.jpeg"));
		originImage.image = UIImage(named:"ao1");
		// add tap vào view để show ra màn hình edit.
		tapShowEdit = UITapGestureRecognizer(target:self, action:#selector(self.showEditer(_:)));
		tapShowEdit.numberOfTapsRequired = 1;
		tapShowEdit.numberOfTouchesRequired  = 1;
		designImage.addGestureRecognizer(tapShowEdit);
		designImage.isUserInteractionEnabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	// MARK - priavte function
	
	@objc private func showEditer(_ sender: UITapGestureRecognizer){
		let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
		
		photoEditor.photoEditorDelegate = self
		
		let img = UIImage(named:"1");
		
		photoEditor.image = img;
		
		//Colors for drawing and Text, If not set default values will be used
		//        photoEditor.colors = [.red,.blue,.green]
		
		//Stickers that the user will choose from to add on the image
		for i in 0...10 {
			photoEditor.stickers.append(UIImage(named: i.description )!)
		}
		
		//To hide controls - array of enum control
		//        photoEditor.hiddenControls = [.crop, .draw, .share]
		
		present(photoEditor, animated: true, completion: nil)
	}

}
