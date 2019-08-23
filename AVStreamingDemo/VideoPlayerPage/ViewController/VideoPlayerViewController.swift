import AVKit

class VideoPlayerViewController: AVPlayerViewController {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.player?.play()
        configureGestures()
    }

    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
        super.viewWillAppear(animated)
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
