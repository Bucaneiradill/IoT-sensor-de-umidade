//
//  ContentView.swift
//  IoT-Swift
//
//  Created by Turma01-14 on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var infoUmidade = Umidade(umidade: "")
    var body: some View {
        ZStack{
            Color.verdeClaro
            VStack(alignment: .center) {
                ZStack(alignment: .bottomTrailing){
                    Image("UmidadeSolo")
                        .frame(width: 395, height: 300, alignment: .center)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20,
                                topTrailingRadius: 0
                            )
                        )
                    VStack{
                        Text("Última leitura")
                            .foregroundStyle(Color.white)
                        Text("\(viewModel.umidades.last?.umidade ?? "0")%")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .padding()
                }
                VStack{
                    ScrollView{
                        ForEach(viewModel.umidades.reversed(), id: \.self){
                            e in
                            VStack{
                                HStack(alignment: .center){
                                    Image(systemName: "drop.degreesign.fill")
                                        .imageScale(.large)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(.azul)
                                    Text("\(e.umidade)%")
                                        .font(.title3)
                                        .foregroundStyle(Color.gray)
                                    Spacer()
                                }
                                Divider()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .frame(width: 350, height: 535)
                    .background()
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 20
                        )
                    )
                }
            }
            .onAppear(){
                viewModel.fetch()
            }
            .padding(.bottom, 10)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
