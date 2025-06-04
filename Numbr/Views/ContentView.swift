/*
@file       : ContentView.swift
@project    : Numbr
@brief      : Main UI of the calculator app
@details    : Displays input/output fields and grid buttons
@date       : 04-06-2025
@author     : J. Pleunes
 
@license    :
   MIT License

   Copyright (c) 2025 Julius Pleunes

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
*/

// Importing necessary modules
import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var hSize
    @State private var input: String = ""
    @State private var output: String = ""

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 16) {
                Spacer()

                VStack(alignment: .trailing, spacing: 10) {
                    Text(input)
                        .font(.system(size: 32, weight: .light))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)

                    Text(output)
                        .font(.system(size: 60, weight: .regular))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)

                if geo.size.width > geo.size.height {
                    LandscapeLayout(input: $input, output: $output)
                } else {
                    PortraitLayout(input: $input, output: $output)
                }

                Spacer()
            }
            .padding()
            .background(Theme.background.ignoresSafeArea())
        }
    }
}
