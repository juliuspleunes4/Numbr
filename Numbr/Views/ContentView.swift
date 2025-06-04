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
    @State private var input: String = ""
    @State private var output: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            VStack(alignment: .trailing, spacing: 10) {
                Text(input)
                    .font(.system(size: 40, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .trailing)

                Text(output)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.accentColor)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)

            ButtonGrid(input: $input, output: $output)

            Spacer(minLength: 40)
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
}

