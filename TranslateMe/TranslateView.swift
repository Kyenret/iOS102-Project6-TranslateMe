//
//  TranslateView.swift
//  TranslateMe
//
//  Created by Kyenret Yakubu Ayuba on 4/5/24.
//
//

import SwiftUI

struct TranslateView: View {
    @State private var inputText = ""
    @State private var outputText = "" // Ensure outputText starts empty
    @State private var translationHistory: [String] = [] // Store translation history
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter text to translate", text: $inputText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Translate") {
                    translate(input: inputText)
                }
                .padding()
                
                TextField("Translated Text", text: $outputText) // Display translated text here
                    .padding()
                
                Spacer()
                
                // Display translation history
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Translation History") // Display title outside the loop
                            .font(.title) // Adjust font and styling as needed
                            .padding(.bottom, 8) // Add padding below the title
                                
                        ForEach(translationHistory, id: \.self) { translation in
                            Text(translation)
                                .padding(.vertical, 4)
                        }
                    }
                }
                
                // Button to erase translation history
                Button("Erase History") {
                    eraseHistory()
                }
                .padding()
            }
            .navigationTitle("TranslateMe")
        }
    }
    
    private func translate(input: String) {
        let encodedInputText = input.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://api.mymemory.translated.net/get?q=\(encodedInputText)&langpair=en|it"
        
        Task {
            if let url = URL(string: urlString) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let translateResponse = try JSONDecoder().decode(ResponseTranslate.self, from: data)
                    outputText = translateResponse.responseData.translatedText
                    
                    // Add translation to history
                    translationHistory.append("\(input) -> \(outputText)")
                } catch {
                    print(error.localizedDescription)
                    outputText = "Translation failed"
                }
            } else {
                outputText = "Invalid URL"
            }
        }
    }
    
    private func eraseHistory() {
        // Clear translation history
        translationHistory.removeAll()
    }
}

struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}



//import SwiftUI
//
//struct TranslateView: View {
//    @State private var inputText = ""
//    @State private var outputText = "" // Ensure outputText starts empty
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter text to translate", text: $inputText)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//                Button("Translate") {
//                    translate(input: inputText)
//                }
//                .padding()
//                
//                Text(outputText) // Display translated text here
//                    .padding()
//                
//                Spacer()
//            }
//            .navigationTitle("TranslateMe")
//        }
//    }
//    
//    private func translate(input: String) {
//        // Construct the URL dynamically using the user's input text and desired language pair
//        let encodedInputText = input.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://api.mymemory.translated.net/get?q=\(encodedInputText)&langpair=en|it"
//        
//        Task {
//            if let url = URL(string: urlString) {
//                do {
//                    let (data, _) = try await URLSession.shared.data(from: url)
//                    let translateResponse = try JSONDecoder().decode(ResponseTranslate.self, from: data)
//                    outputText = translateResponse.responseData.translatedText
//                } catch {
//                    print(error.localizedDescription)
//                    outputText = "Translation failed"
//                }
//            } else {
//                outputText = "Invalid URL"
//            }
//        }
//    }
//}
//
//struct TranslateView_Previews: PreviewProvider {
//    static var previews: some View {
//        TranslateView()
//    }
//}


//import SwiftUI
//
//struct TranslateView: View {
//    @State private var inputText = ""
//    @State private var outputText = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter text to translate", text: $inputText)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//                Button("Translate") {
//                    translate(input: inputText)
//                }
//                .padding()
//                
//                Text(outputText)
//                    .padding()
//                
//                Spacer()
//            }
//            .navigationTitle("TranslateMe")
//        }
//    }
//    
//    private func translate(input: String) {
//        
//        // Construct the URL dynamically using the user's input text and desired language pair
//            let encodedInputText = input.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//            let urlString = "https://api.mymemory.translated.net/get?q=\(encodedInputText)&langpair=en|it"
//            
//        //let urlString = "https://api.mymemory.translated.net/get?q=Hello%20World!&langpair=en|it"
//        
//        Task {
//            if let url = URL(string: urlString) {
//                do {
//                    let (data, _) = try await URLSession.shared.data(from: url)
//                    let translateResponse = try JSONDecoder().decode(ResponseTranslate.self, from: data)
//                    outputText = translateResponse.responseData.translatedText
//                } catch {
//                    print(error.localizedDescription)
//                    outputText = "Translation failed"
//                }
//            } else {
//                outputText = "Invalid URL"
//            }
//        }
//    }
//}
//
//struct TranslateView_Previews: PreviewProvider {
//    static var previews: some View {
//        TranslateView()
//    }
//}


//import SwiftUI
//
//struct TranslateView: View {
//    
//  //  @State var translateManager: TranslateManager
//    
//    // TODO: Access authManager from the environment
//   // @Environment(AuthManager.self) var authManager
//    
//    
//    var body: some View {
//        NavigationStack {
//            Text("Welcome to TranslateMe!")
//                .navigationTitle("Translate")
//                .navigationBarTitleDisplayMode(.inline)
//            
//            Button("Translate") {
//                translate(input: "Hello World!") // Call translate function here
//            }
//                //.toolbar {
//                   // ToolbarItem {
//                     //   Button("Sign out") {
//                        //    authManager.signOut()
//                     //   }
//                   // }
//               // }
//        }
//    }
//    
//    private func translate(input: String) {
//        let urlString = "https://api.mymemory.translated.net/get?q=Hello%20World!&langpair=en|it"
//        
//        Task {
//            let url = URL(string: urlString)!
//            do {
//                let (data, _) = try await
//                URLSession.shared.data(from: url)
//                
//                let translateResponse = try
//                JSONDecoder().decode(ResponseTranslate.self, from: data)
//                
//                let translate = translateResponse.responseData
//                print(translate)
//            }
//            catch {
//                print(error.localizedDescription)
//                
//            }
//            
//            
//        }
//    }
//}
//
//#Preview {
//    TranslateView()
//       // .environment(AuthManager()) // <-- Pass an AuthManager instance into the preview environment as well
//}
//        
