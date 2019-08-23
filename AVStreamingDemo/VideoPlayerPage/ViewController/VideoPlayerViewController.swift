import AVKit

class VideoPlayerViewController: AVPlayerViewController {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
        do {
            try AVAudioSession.sharedInstance().setActive(false,
                                                          options: .notifyOthersOnDeactivation)
        } catch let error as NSError {
            print("Failed to deactivate audio session: \(error.localizedDescription)")
        }
        super.viewWillAppear(animated)
    }

    private func configureView() {
        self.player?.play()
        configureGestures()
        try? AVAudioSession.sharedInstance().setCategory(.playback,
                                                         mode: .moviePlayback,
                                                         options: [.defaultToSpeaker, .interruptSpokenAudioAndMixWithOthers])
    }

    @objc func screenEdgeSwipedLeft(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            coordinator?.dismiss()
        }
    }

    private func configureGestures() {
        let edgePanLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwipedLeft))
        edgePanLeft.edges = .left
        view.addGestureRecognizer(edgePanLeft)
    }
}
