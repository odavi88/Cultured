//
//  ProgressDialFix.swift
//  Cultured
//
//  Created by Omar Davidson II on 6/3/23.
//

import SwiftUI

// MARK: - ViewModel

class CitaViewModel: ObservableObject {
    @Published var selectedIndex = 0
    @Published var pendingActivities = [
        "Activity 1",
        "Activity 2",
        "Activity 3",
        "Activity 4",
        "Activity 5",
        "Activity 6",
        "Activity 7",
        "Activity 8",
        "Activity 9",
        "Activity 10",
    ]
    @Published var completedActivities: [String] = []
    @Published var progress: Float = 0.0
    
    func completeActivity(activity: String) {
        if let index = pendingActivities.firstIndex(of: activity) {
            pendingActivities.remove(at: index)
            completedActivities.append(activity)
            progress = Float(completedActivities.count) / Float(completedActivities.count + pendingActivities.count)
        }
    }
}

// MARK: - Views

struct TheView: View {
    @StateObject private var viewModel = CitaViewModel()
    
    var body: some View {
        VStack {
            Picker(selection: $viewModel.selectedIndex, label: Text("")) {
                Text("Pending").tag(0)
                Text("Completed").tag(1)
                Text("Progress").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if viewModel.selectedIndex == 0 {
                PendingActivitiesView(viewModel: viewModel)
            } else if viewModel.selectedIndex == 1 {
                CompletedActivitiesView(viewModel: viewModel)
            } else if viewModel.selectedIndex == 2 {
                ProgressView(viewModel: viewModel)
                Spacer()
            }
        }
    }
}

struct PendingActivitiesView: View {
    @ObservedObject var viewModel: CitaViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.pendingActivities, id: \.self) { activity in
                HStack {
                    Text(activity)
                    Spacer()
                    Button(action: {
                        viewModel.completeActivity(activity: activity)
                    }) {
                        Text("Complete")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct CompletedActivitiesView: View {
    @ObservedObject var viewModel: CitaViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.completedActivities, id: \.self) { activity in
                Text(activity)
            }
        }
    }
}

struct ProgressView: View {
    @ObservedObject var viewModel: CitaViewModel
    
    var body: some View {
        VStack {
            Text("Progress: \(Int(viewModel.progress * 100))%")
                .font(.title)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(viewModel.progress))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            }
        }
    }
}

// MARK: - Preview

struct TheView_Previews: PreviewProvider {
    static var previews: some View {
        TheView()
    }
}
