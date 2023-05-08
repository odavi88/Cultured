//
//  NavigationTestView.swift
//  Cultured
//
//  Created by Omar Davidson II on 5/7/23.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
}

class PersonViewModel: ObservableObject {
    @Published var people = [
        Person(name: "Omar Davidson"),
        Person(name: "Darth Vader"),
        Person(name: "The Joker"),
        Person(name: "Barack Obama"),
    ]
    
    init(people: [Person]) {
        self.people = people
    }
}

struct OtherView: View {
    var body: some View {
        Text("Other View.")
    }
}


struct NavigationTestView: View {
    @ObservedObject var vm: PersonViewModel
    var body: some View {
        List {
            ForEach(vm.people) { person in
                Text(person.name)
            }
        }
    }
}

struct NavigationTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTestView(vm: PersonViewModel(people: [Person(name: "Omar Davidson")]))
            .environmentObject(PersonViewModel(people: [Person(name: "")]))
    }
}
