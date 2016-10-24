//
//  IntroViewController.swift
//  Carousel
//
//  Created by Stephan Charbit on 10/18/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!    
    @IBOutlet weak var tile6View: UIImageView!
    
    // Arrays of initial transform values for tiles
    var yOffsets : [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [CGFloat] = [-30, 75, -66, 10, -200, -15]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-15, -20, 30, 10, 10, -10]
    
    override func viewDidLoad() {
        scrollView.delegate = self
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTransforms(targetView:UIImageView, targetID:Int){
        var offset = Float(scrollView.contentOffset.y)
        var ID = targetID-1
        var tx = convertValue(inputValue: CGFloat(offset), r1Min:0, r1Max: 475, r2Min: xOffsets[ID], r2Max: 0)
        var ty = convertValue(inputValue: CGFloat(offset), r1Min:0, r1Max: 475, r2Min: yOffsets[ID], r2Max: 0)
        var scale = convertValue(inputValue: CGFloat(offset), r1Min:0, r1Max: 475, r2Min: scales[ID], r2Max: 1)
        var rotation = (convertValue(inputValue: CGFloat(offset), r1Min:0, r1Max: 475, r2Min: rotations[ID], r2Max: 1) - 1.0)
        targetView.transform = CGAffineTransform(translationX: tx, y: ty)
        targetView.transform = targetView.transform.scaledBy(x: CGFloat(scale), y: CGFloat(scale))
        targetView.transform = targetView.transform.rotated(by: CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        setTransforms(targetView: tile1View, targetID: 1)
        setTransforms(targetView: tile2View, targetID: 2)
        setTransforms(targetView: tile3View, targetID: 3)
        setTransforms(targetView: tile4View, targetID: 4)
        setTransforms(targetView: tile5View, targetID: 5)
        setTransforms(targetView: tile6View, targetID: 6)
        
        
    }
}


