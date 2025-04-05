//
//  ConsoleView.swift
//  Tern
//
//  Created by sole on 4/5/25.
//

import SwiftUI

struct ConsoleView: View {
    @State var isVisible: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()

                Button {
                    withAnimation(.bouncy) {
                        isVisible.toggle()
                    }
                } label: {
                    Image(systemName: "mount.fill")
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .onHover(perform: { _ in

            })
            .contentShape(Rectangle())

            if isVisible {
                PreviewView()
            }
        }
    }
}

struct PreviewView: View {
    @State var outputText: String = "test\n123"
    @State var isEditable: Bool = false

    var body: some View {
        TextEditor(text: $outputText)
            .scrollContentBackground(.hidden)
            .disabled(!isEditable)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black)
            .foregroundStyle(Color.white)
    }
}

#Preview {
    ConsoleView()
}
