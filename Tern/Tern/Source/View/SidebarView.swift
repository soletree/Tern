//
//  SidebarView.swift
//  Tern
//
//  Created by sole on 4/4/25.
//

import SwiftUI

struct SidebarView: View {
    @State var fileNames: [String]
    @Binding var selectedFile: String?

    var body: some View {
        List(fileNames, id: \.self) { fileName in
            FileRowView(
                fileName: fileName,
                fileType: "swift"
            )
            .background {
                if selectedFile == fileName {
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundStyle(Color.secondary)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                selectedFile = fileName
            }
        }
    }
}

struct FileRowView: View {
    let fileName: String
    let fileType: String

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: fileType)
                .renderingMode(.template)
                .foregroundStyle(Color.orange)

            Text(fileName)
        }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SidebarView(
        fileNames: (1...100)
            .compactMap { "\($0).swift" },
        selectedFile: .constant(nil)
    )
}
