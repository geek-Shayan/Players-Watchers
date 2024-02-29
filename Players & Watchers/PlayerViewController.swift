//
//  PlayerViewController.swift
//  Players & Watchers
//
//  Created by SHAYANUL HAQ SADI on 7/9/23.
//

import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {
    
    static let identifier = "PlayerViewController"
    
    var sPlayer : AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        sPlayer?.play()
        
        let videoURL = URL(string: "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.playerView.bounds
//        self.playerView.layer.addSublayer(playerLayer)
        player = AVPlayer(url: videoURL!)
//        player.play()
        player?.play()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
