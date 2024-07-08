//
//  ScrollView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/8/24.
//

import SwiftUI

struct InfiniteScrollView: View {
    @State private var cells: [CellData] = (0..<20).map { _ in CellData.generateRandomEmoji() }
    private var cellTypes: [CellType] = [.first, .second, .third, .fourth]
    
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 217/255, blue: 224/255)
                .edgesIgnoringSafeArea(.all)
                    
            ScrollView {
                LazyVStack {
                    ForEach(cells) { cellData in
                        let cellType = cellTypes.randomElement()!
                        CustomCellView(cellData: cellData, cellType: cellType)
                            .padding(10)
                            .onAppear {
                                if cellData == cells.last {
                                    loadMoreCells()
                                }
                            }
                    }
                }
            }
            .background(Color.clear)
        }
    }

    
    private func loadMoreCells() {
        let moreCells = (0..<20).map { _ in CellData.generateRandomEmoji() }
        cells.append(contentsOf: moreCells)
    }
}

#Preview {
    InfiniteScrollView()
}
