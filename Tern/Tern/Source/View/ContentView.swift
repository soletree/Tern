//
//  ContentView.swift
//  Tern
//
//  Created by sole on 4/4/25.
//

import SwiftUI

struct ContentView: View {
    private let fileNames: [String] = (1...100)
        .compactMap { "\($0).swift" }
    @State var selectedFileName: String?

    var body: some View {
        NavigationSplitView {
            SidebarView(
                fileNames: fileNames,
                selectedFile: $selectedFileName
            )
        } detail: {
            VSplitView {
                SourceCodeView()

                ConsoleView()
            }
        }
        .navigationSubtitle(
            Text(selectedFileName ?? "")
        )
        .toolbar {
            Button {
                // run swift file
            } label: {
                Image(systemName: "play.fill")
            }
        }
        .navigationDocument(URL(string: "") ?? .applicationDirectory)
    }
}

#Preview {
    ContentView()
}
