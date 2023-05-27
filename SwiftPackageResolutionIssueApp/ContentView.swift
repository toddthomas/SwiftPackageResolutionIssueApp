//
//  ContentView.swift
//  SwiftPackageResolutionIssueApp
//
//  Created by Todd Thomas on 5/16/23.
//

import SwiftUI
import libfib

struct ContentView: View {
    @State var n = 3

    var body: some View {
        VStack {
            Stepper(value: $n, in: 0...100) {
                Text("fib(\(n)) = \(fib(n))")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
