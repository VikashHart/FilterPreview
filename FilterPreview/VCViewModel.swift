import UIKit

protocol VCViewModeling {
    var cellSpacing: CGFloat { get }
    var numberOfSpaces: CGFloat { get }
    var numberOfCells: CGFloat { get }

    var selectedIndex: IndexPath { get set }
}

class VCViewModel: VCViewModeling {
    var cellSpacing: CGFloat

    var numberOfSpaces: CGFloat

    var numberOfCells: CGFloat

    var selectedIndex: IndexPath

    init(cellSpacing: CGFloat = 10,
         numberOfCells: CGFloat = 1,
         selectedIndex: IndexPath = IndexPath(row: 0, section: 0)) {
        self.cellSpacing = cellSpacing
        self.numberOfCells = numberOfCells
        self.numberOfSpaces = numberOfCells + 1
        self.selectedIndex = selectedIndex
    }
}
