import UIKit
import AVKit

protocol MainVCViewModeling {
    var cellSpacing: CGFloat { get }
    var numberOfCells: CGFloat { get }
    var numberOfSpaces: CGFloat { get }
    var sources: [SourceModel] { get }
    var player: AVPlayer { get }
}

class MainVCViewModel: MainVCViewModeling {
    var cellSpacing: CGFloat

    var numberOfCells: CGFloat

    var numberOfSpaces: CGFloat

    var sources: [SourceModel]

    var player: AVPlayer

    init(cellSpacing: CGFloat = 10,
         numberOfCells: CGFloat = 1,
         sources: SourceModeling = Sources(),
         player: AVPlayer = AVPlayer()) {
        self.cellSpacing = cellSpacing
        self.numberOfCells = numberOfCells
        self.numberOfSpaces = numberOfCells + 1
        self.sources = sources.data
        self.player = player
    }
}
