//
//  SourceCodeView.swift
//  Tern
//
//  Created by sole on 4/4/25.
//

import SwiftUI

struct SourceCodeView: View {
    @State var code: String = ""

    var body: some View {
        VStack {
            TextEditor(text: $code)
                .font(.custom("SF Mono Medium", size: 16))
                .scrollContentBackground(.hidden)
                .background(Color.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SourceCodeView()
}
