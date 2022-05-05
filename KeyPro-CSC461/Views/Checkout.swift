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
    @State var isShow: Bool = false
    
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
                    isShow = true
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
                    .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    .padding(.top, 5)
                Spacer()
            }
            .padding()
        }
        
        Addressform()
            .padding()
        
        PaymentMedthod()
            .padding()
        
        //        VStack (alignment: .leading, spacing: 8, content:{
        //            Text("Order")
        //                .font(.system(size: 20, weight: .semibold, design: .serif ))
        //                .fontWeight(.bold)
        //                .foregroundColor(.black)
        //
        //            Divider()
        //
        //            HStack(spacing: 20) {
        //                Image(cartManager.products[0].image)
        //                    .resizable()
        //                    .aspectRatio(contentMode: .fit)
        //                    .frame(width: 50)
        //                    .cornerRadius(10)
        //
        //                VStack(alignment: .leading, spacing: 10) {
        //                    Text(cartManager.products[0].name)
        //                        .bold()
        //
        //                    Text(String(format: "%.2f", cartManager.products[0].price))
        //                }
        //
        //                Spacer()
        //            }
        //
        //        })
        //        .padding()
        
        ScrollView {
            if cartManager.products.count > 0 {
                
                ForEach(0..<cartManager.products.count, id: \.self) { index in ProductRow(product: cartManager.products[index], index: index, isDeletable: false) }
                
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(format: "%.2f฿", cartManager.total))
                        .bold()
                }
                .padding()
                
            } else {
                Text("Your cart is empty")
            }
        }
        
        NavigationLink(destination: MyOrder(), isActive: $isShow) {
            EmptyView()
        }
        PaymentButton(action: {
            createTransaction()
        })
        .padding()
        //        NavigationLink {
        //            MyOrder()
        //        } label: {
        ////            Checkoutbutton()
        ////                .padding(.top,250)
        ////                .zIndex(1)
        //            PaymentButton(action: {})
        //                .padding()
        //        }
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


