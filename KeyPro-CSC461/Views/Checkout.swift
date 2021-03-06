//
//  Checkout.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Checkout: View {
    
    @EnvironmentObject var cartManager: CartManager
    @State var isSelected: Bool = false
    @State var items = [itemModel]()
    
    func createTransaction() {
        for i in 0..<cartManager.products.count {
            items.append(itemModel(name: cartManager.products[i].name, image: cartManager.products[i].image, price_per_piece: cartManager.products[i].price))
        }
        print("ITEM HERE \(items)")
        
        if items.count > 0 {
            var model = requestCreateTransactionModel()
            model.item = items
            model.total = cartManager.total
            
            TransactionViewModel().create(reqObj: model) { result in
                switch result {
                case .success(let response):
                    print("Success",response)
                    KeyPro_CSC461App(rootView: .OrderView)
                case .failure(let error):
                    switch error{
                    case .BackEndError(let msg):
                        print("Error: \(msg)")
                    case .Non200StatusCodeError(let val):
                        print("Error Code: \(val.status) - \(val.message)")
                    case .UnParsableError:
                        print("Error \(error)")
                    case .NoNetworkError:
                        print("No Network Error")
                    }
                }
            }
        }
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Check Out")
                    .font(.system(size: 28, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 5)
                Spacer()
            }
            .padding()
        }
        
        Addressform()
            .padding()
        
        PaymentMedthod()
            .padding()
        
        ScrollView {
            if cartManager.products.count > 0 {
                
                ForEach(0..<cartManager.products.count, id: \.self) { index in ProductRow(product: cartManager.products[index], index: index, isDeletable: false) }
                
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(format: "%.2f???", cartManager.total))
                        .bold()
                }
                .padding()
                
            } else {
                Text("Your cart is empty")
            }
        }
        PaymentButton(action: {
            createTransaction()
        })
        .padding()
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
        CartView()
            .environmentObject(CartManager())
    }
}
