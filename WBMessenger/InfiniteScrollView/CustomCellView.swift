//
//  CustomCellView.swift
//  WBMessenger
//
//  Created by Tatiana Lazarenko on 7/8/24.
//

import SwiftUI

enum CellType {
    case first, second, third, fourth
}

struct CustomCellView: View {
    let cellData: CellData
    let cellType: CellType
    
    var roundedRectangle: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color.purple, style: StrokeStyle(lineWidth: 4, dash: [7]))
            .padding(4)
    }
    
    var emoji: some View {
        Text(cellData.emoji)
            .font(.system(size: 50))
            .frame(width: 100, height: 100)
            .opacity(0.7)
    }
    
    var body: some View {
        switch cellType {
        case .first:
            ZStack {
                VStack {
                    HStack {
                        roundedRectangle
                        roundedRectangle
                    }
                    roundedRectangle
                }
                emoji
            }
        case .second:
            ZStack {
                HStack {
                    VStack {
                        roundedRectangle
                        roundedRectangle
                    }
                    roundedRectangle
                }
                emoji
            }
        case .third:
            ZStack {
                VStack {
                    roundedRectangle
                    HStack {
                        roundedRectangle
                        roundedRectangle
                    }
                }
                emoji
            }
        case .fourth:
            ZStack {
                HStack {
                    roundedRectangle
                    VStack {
                        roundedRectangle
                        roundedRectangle
                    }
                }
                emoji
            }
            
        }
    }
}
