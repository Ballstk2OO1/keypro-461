//
//  ContentView.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @State var productList = [Product]()
    
    func getAllProduct() {        
        TransactionViewModel().getAll() { result in
            switch result {
            case .success(let res):
                print("HERE \(res)")
                for i in 0..<(res.switches?.count ?? 0) {
                    productList.append(Product(name: res.switches?[i].name ?? "", image: "\(Constants.ENDPOINT)\(res.switches?[i].image ?? "")", price: res.switches?[i].price_per_piece ?? 0.0, description: res.switches?[i].description))
                }
            case .failure(let err):
                switch err {
                case .Non200StatusCodeError(let val):
                    print("Error code \(val.status) \(val.message)")
                case .BackEndError(let msg):
                    print("Message: \(msg)")
                case .NoNetworkError:
                    print("No Network Error")
                case .UnParsableError:
                    print("Error \(err)")
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    if productList.count > 0 {
                        ForEach(productList, id: \.id) { product in
                            NavigationLink {
                                ProductDetailView(product: product)
                                    .environmentObject(cartManager)
                            } label: {
                                ProductCard(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                    } else {
                        Text("ไม่พบสินค้า กรุณาลองใหม่อีกครั้ง")
                    }
                }
                .padding()
            }
            .onAppear {
                getAllProduct()
            }
            .navigationTitle(Text("KeyPro"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProduct: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
