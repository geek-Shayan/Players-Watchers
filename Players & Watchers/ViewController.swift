//
//  ViewController.swift
//  Players & Watchers
//
//  Created by SHAYANUL HAQ SADI on 31/8/23.
//

import UIKit
import AVKit
import AVFoundation
import WebKit


class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var playerView: UIView!
    
    // A streamController object is defined to handle the AVPlayerViewController event.
    var streamController = AVPlayerViewController()
    
    // The AVPlayer object has been defined.
    var streamPlayer : AVPlayer?
    @IBOutlet weak var BrightnessProgress: UIProgressView! {
        didSet{
//            BrightnessProgress.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }
    
    @IBOutlet weak var BrightnessSlider: CustomSlider!{
        didSet{
//            BrightnessSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    var currentBrightness: CGFloat = 1.0
    var selectedBrightness: CGFloat = 1.0
    
    static let userId = "123123"
    static let apikey = "cb8590ce-627a-485b-aafa-822d92ef9c06"
    static let roomId = "ashik987"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBrightness = UIScreen.main.brightness
        UserDefaults.standard.set(currentBrightness, forKey: "currentBrightness")
        debugPrint("===== brightness get - \(String(describing: UserDefaults.standard.value(forKey: "currentBrightness") ?? 0.5))")
        BrightnessSlider.value = Float(currentBrightness)
        
        
        selectedBrightness = CGFloat(BrightnessSlider.value)
        UserDefaults.standard.set(selectedBrightness, forKey: "selectedBrightness")

        
        initiatePlayerView() // player auto play in viewcontroller
        
        initiatePlayer()  // on the button default player on popup view
        
        initiateWebView()
        
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        initiatePlayerView()
        
//        initiatePlayerInViewController()
        
//        initiatePlayer()
//
//        initiateWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIScreen.main.brightness = selectedBrightness
        BrightnessSlider.value = Float(selectedBrightness)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIScreen.main.brightness = currentBrightness
        BrightnessSlider.value = Float(currentBrightness)
        
        debugPrint("===== brightness get - \(String(describing: UserDefaults.standard.value(forKey: "currentBrightness") ?? 0.5))")
        
    }
   
    private func initiatePlayerView() {
        let videoURL = URL(string: "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4")
        let player = AVPlayer(url: videoURL!)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.layer.bounds
//        playerLayer.masksToBounds = true
//        self.playerView.layer.addSublayer(playerLayer)
        self.playerView.layer.addSublayer(playerLayer)
        
//        playerView.layer.needsLayout()
        player.play()
    }
    
    
    
    
    private func initiateWebView() {
//        let webUrl = "https://web-staging.tsports.com/live?content_id=0&msisdn=+8801722325732&app_id=1&session_token=asdfghjkl"
//        let webUrl = "https://web.stage.watchers.io/?userId=12366&roomId=ashik987&apikey=cb8590ce-627a-485b-aafa-822d92ef9c06"
        let webUrl = "https://web.stage.watchers.io/?userId=\(ViewController.userId)&roomId=\(ViewController.roomId)&apikey=\(ViewController.apikey)"

        if let url = URL(string: webUrl) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    
    private func initiatePlayer() {
        // Stream Video URL value video related information - url info
        let streamVideoURL : NSURL? = NSURL(string: "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4")
        
        // Assigned to streamPlayer object
        streamPlayer = AVPlayer(url: streamVideoURL! as URL)
        
        // Player object is assigned to player value in streamController.
        streamController.player = streamPlayer
//        streamController.player?.play()

    }
    
    
    private func initiatePlayerInViewController() {

        let videoURL = URL(string: "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4")
//        let player = AVPlayer(url: videoURL!)
        
        let player = AVPlayer(url: videoURL! as URL )
        let playerController = AVPlayerViewController()

        playerController.player = player
        self.addChild(playerController)
        self.view.addSubview(playerController.view)
//        self.playerView.addSubview(playerController.view)
//        playerController.view.frame = self.view.frame
        playerController.view.frame = self.playerView.frame

    }
    
    @IBAction func nextPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true)
        
    }
    


    @IBAction func playButtonPressed(_ sender: Any) {
                
        self.present(streamController, animated: true, completion: {

            self.streamController.player?.play()

        })
    }
    
    
    @IBAction func sliderMoved(_ sender: Any) {
//        UIScreen.main.brightness = brightness
        UIScreen.main.brightness = CGFloat(BrightnessSlider.value)
        debugPrint("===== userdefaults brightness get- \(UserDefaults.standard.value(forKey: "currentBrightness") ?? 0.5)")
        debugPrint("===== brightness - \(CGFloat(BrightnessSlider.value))")
//        UIScreen.main.brightness = CGFloat(0.3)
        
        selectedBrightness = CGFloat(BrightnessSlider.value)
        UserDefaults.standard.set(selectedBrightness, forKey: "selectedBrightness")
//        UIScreen.animateBrightness(to: CGFloat(BrightnessSlider.value))

    }
    
    
    
    
    
    
}


extension UIScreen {

   private static let step: CGFloat = 0.1

   static func animateBrightness(to value: CGFloat) {
       guard abs(UIScreen.main.brightness - value) > step else { return }

       let delta = UIScreen.main.brightness > value ? -step : step

       DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
           UIScreen.main.brightness += delta
           animateBrightness(to: value)
       }
   }
}
