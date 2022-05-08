//
//  historyDetailVIew.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 6/5/2565 BE.
//

import SwiftUI

struct historyDetailView: View {
    @StateObject var historyDetail = HistoryDetailObservedModel()
    @State var productList = [Product]()
    
    func setProductList() {
        productList.removeAll()
        for i in 0..<(historyDetail.item?.count ?? 0) {
            productList.append(Product(name: historyDetail.item?[i].name ?? "", image: historyDetail.item?[i].image ?? "", price: historyDetail.item?[i].price_per_piece ?? 0.0))
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Orders Detail")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(.black)
                .frame(alignment: .leading)
                .padding(.top, 50)
            
            Text("Order ID: \(historyDetail.id ?? "")")
            Text("Order Date: \(historyDetail.date ?? "")")
            Text("Order Amount: \(productList.count)")
            ScrollView {
                ForEach(0..<productList.count, id: \.self) { index in ProductRow(product: productList[index], index: index, isDeletable: false) }
            }
            HStack {
                Text("Total")
                Spacer()
                Text(String(format: "%.2f฿", historyDetail.total ?? 0.0))
                    .bold()
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            setProductList()
        }
    }
}

struct historyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        historyDetailView()
    }
}
