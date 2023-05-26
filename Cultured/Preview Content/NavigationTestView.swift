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
    
    static var person: [Person] = [
    
        Person(name: "Agent 47"),
        Person(name: "Diana Burnwood"),
        Person(name: "Oliva Hall"),
        Person(name: "The Shadow Client"),
    
    ]
}

class PersonViewModel: ObservableObject {
    @Published var people: [Person]
    
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
        NavigationTestView(vm: PersonViewModel(people: [
//            Person(name: "Omar Davidson"),
//            Person(name: "President Barak Obama"),
//            Person(name: "Carie Fischer"),
//            Person(name: "Archer"),
//            Person(name: "J.K. Rowling"),
        ])
        )
            .environmentObject(PersonViewModel(people: [Person(name: "")]))
    }
}
