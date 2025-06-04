/*
@file       : ContentView.swift
@project    : Numbr
@brief      : Calculator app for iPadOS
@details    : This app tries to mimick the official iOS calculator app
              as well as possible.
@date       : 04-06-2025
@author     : J. Pleunes
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
