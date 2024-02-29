//
//  CustomSlider.swift
//  Players & Watchers
//
//  Created by SHAYANUL HAQ SADI on 11/6/23.
//

import UIKit

class CustomSlider: UISlider {


    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Hide the thumb or slider handle
        setThumbImage(UIImage(), for: .normal)
        setThumbImage(UIImage(), for: .highlighted)
        
        // You can also customize the appearance of the slider's track
//        let trackHeight: CGFloat = 14.0 // Adjust the height as needed
        let trackTintColor = UIColor.blue // Change the color as needed
        minimumTrackTintColor = UIColor.white
        maximumTrackTintColor = .gray
        
//        trackRect(forBounds: CGRect(x: 0, y: 0, width: 50, height: 100))
        
        let trackHeight: CGFloat = 8.0 // Adjust the height as needed
        let trackRectval = CGRect(x: 0, y: (bounds.size.height - trackHeight) / 2, width: bounds.size.width, height: trackHeight)
        trackRect(forBounds: trackRectval)
        
        
        
        
        // Set the track height
//        minimumTrackImage = UIImage()
//        maximumTrackImage = UIImage()
        
        // Optionally, add additional customization here
    }


}
