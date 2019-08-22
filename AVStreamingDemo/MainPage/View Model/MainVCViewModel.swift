import UIKit

protocol MainVCViewModeling {
    var cellSpacing: CGFloat { get }
    var numberOfCells: CGFloat { get }
    var numberOfSpaces: CGFloat { get }
    var sources: [SourceModel] { get }
}

class MainVCViewModel: MainVCViewModeling {
    var cellSpacing: CGFloat

    var numberOfCells: CGFloat

    var numberOfSpaces: CGFloat

    var sources: [SourceModel]

    init(cellSpacing: CGFloat = 10,
         numberOfCells: CGFloat = 1,
         sources: SourceModeling = Sources()) {
        self.cellSpacing = cellSpacing
        self.numberOfCells = numberOfCells
        self.numberOfSpaces = numberOfCells + 1
        self.sources = sources.data
    }
}
