//
//  RecordButton.swift
//  PredicTalk
//
//  Created by 青原光 on 2023/10/28.
//

import SwiftUI

struct RecordButton: View {
    @Binding var isRecording: Bool

    let strokeWidth: CGFloat = 4
    let buttonSize: CGFloat = 60

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: strokeWidth)
                .fill(.recordButtonRing)
                .frame(width: buttonSize)

            recordButton()
        }
    }

    private func recordButton() -> some View {
        let activeSize = buttonSize / 2
        let inactiveSize = (buttonSize - strokeWidth) * 0.9
        let activeRadius = activeSize / 5
        let inactiveRadius = inactiveSize / 2

        return Button {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            isRecording.toggle()
        } label: {
            RoundedRectangle(cornerRadius: isRecording ? activeRadius : inactiveRadius)
                .fill(.red)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: isRecording ? activeSize : inactiveSize)
        }
    }
}

// なぜかプレビューではBoolが切り替わらない
#Preview("Not Recording") {
    @State var isActive = false

    return RecordButton(isRecording: $isActive)
}

#Preview("Recording") {
    @State var isActive = true

    return RecordButton(isRecording: $isActive)
}
