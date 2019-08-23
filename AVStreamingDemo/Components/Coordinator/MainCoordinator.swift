import AVKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func dismiss() {
        navigationController.popViewController(animated: true)
    }

    func videoPlayerVC(videoUrl: URL) {
        let vc = VideoPlayerViewController()
        vc.coordinator = self
        let player = AVPlayer(url: videoUrl)
        vc.player = player
        navigationController.pushViewController(vc, animated: true)
    }
}
