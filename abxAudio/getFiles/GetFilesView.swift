//
//  getFilesView.swift
//  abxAudio
//
//  Created by GubarevPN on 12.02.2024.
//

import SwiftUI

struct GetFilesView: View {
    var getFilesViewModel: GetFilesViewModel

    var body: some View {
        Button(action: {

        }) {
            Text("Load demo files")
        }
        VStack {
            ProgressView(value: 1) {
                Text("File A")
            }
        }.opacity(shouldShowProgress ? 1 : 0)
    }
}

struct getFiles_Previews: PreviewProvider {
    static var previews: some View {
        GetFilesView(
        )
    }
}
