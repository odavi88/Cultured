//
//  DialColorFix.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/5/23.
//

import SwiftUI

struct Chore: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

class ChoreViewModel: ObservableObject {
    @Published var chores: [Chore] = [
        Chore(name: "Chore 1", isCompleted: false),
        Chore(name: "Chore 2", isCompleted: false),
        Chore(name: "Chore 3", isCompleted: false),
        Chore(name: "Chore 4", isCompleted: false),
        Chore(name: "Chore 5", isCompleted: false),
        Chore(name: "Chore 6", isCompleted: false),
        Chore(name: "Chore 7", isCompleted: false),
        Chore(name: "Chore 8", isCompleted: false),
        Chore(name: "Chore 9", isCompleted: false),
        Chore(name: "Chore 10", isCompleted: false)
    ]

    var completionPercentage: Double {
        let completedChores = chores.filter { $0.isCompleted }
        let percentage = Double(completedChores.count) / Double(chores.count)
        return percentage * 100
    }

    var progressColor: Color {
        switch completionPercentage {
        case 0...15:
            return .red
        case 15...50:
            return .orange
        case 50...85:
            return .yellow
        case 85...100:
            return .green
        default:
            return .clear
        }
    }

    func toggleChoreCompletion(chore: Chore) {
        if let index = chores.firstIndex(where: { $0.id == chore.id }) {
            chores[index].isCompleted.toggle()
        }
    }
}

struct ChoreContentView: View {
    @StateObject private var viewModel = ChoreViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            Picker("View", selection: $selectedIndex) {
                Text("List View").tag(0)
                Text("Progress Dial").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedIndex == 0 {
                ChoreListView(viewModel: viewModel)
            } else {
                ProgressDialView(viewModel: viewModel)
            }
        }
    }
}

struct ChoreListView: View {
    @ObservedObject var viewModel: ChoreViewModel
    
    var body: some View {
        List(viewModel.chores) { chore in
            Toggle(isOn: $viewModel.chores[viewModel.chores.firstIndex(where: { $0.id == chore.id })!].isCompleted) {
                Text(chore.name)
            }
        }
        .padding()
    }
}

struct ProgressDialView: View {
    @ObservedObject var viewModel: ChoreViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Circle()
                    .trim(from: 0, to: CGFloat(viewModel.completionPercentage / 100))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .foregroundColor(viewModel.progressColor)
                    .rotationEffect(Angle(degrees: -90))
                
                Text(String(format: "%.0f%%", viewModel.completionPercentage))
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}


struct ChoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreContentView()
    }
}
