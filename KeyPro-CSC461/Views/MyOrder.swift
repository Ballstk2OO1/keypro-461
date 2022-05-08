//
//  MyOrder.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI
import Kingfisher

struct MyOrder: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                MyOrderView()
                TabBar()
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct MyOrderView: View {
    @ObservedObject var historyObserved = HistoryObservedModel()
    @ObservedObject var historyDetailObserved = HistoryDetailObservedModel()
    @State var isShow: Bool = false
    @State var dateData = [String]()
    func getDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        for i in 0..<(historyObserved.history?.count ?? 0) {
            let date = dateFormat().stringToDate(date: historyObserved.history?[i].created ?? "")
            let dateString = dateFormatter.string(from: date)
            dateData.append(dateString)
        }
    }
    
    func getHistory() {
        TransactionViewModel().getHistory() { result in
            switch result {
            case .success(let response):
                print("Success",response)
                historyObserved.history = response.history
                getDate()
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
    
    func getDetail(id: String) {
        TransactionViewModel().get(reqObj: requestGetTransactionModel(transaction_id: id)) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                //                historyObserved.history = response.history
                //                getDate()
                historyDetailObserved.id = id
                historyDetailObserved.total = response.total
                historyDetailObserved.item = response.item
                historyDetailObserved.owner_name = response.owner_name
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "d MMM yyyy"
                
                let date = dateFormat().stringToDate(date: historyDetailObserved.created ?? "")
                let dateString = dateFormatter.string(from: date)
                
                historyDetailObserved.date = dateString
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
    
    var body: some View {
        VStack {
            
            Text("My Orders")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(.black)
                .frame(alignment: .leading)
                .padding(.top, 5)
            Divider()
            ScrollView {
                if (historyObserved.history?.count ?? 0) > 0 {
                    
                    ForEach(0..<(historyObserved.history?.count ?? 0), id: \.self) { index in
                        historyRow(image: historyObserved.history?[index].item?[0].image ?? "", orderID: historyObserved.history?[index].id ?? "", total: historyObserved.history?[index].total ?? 0.0, date: dateData[index])
                            .onTapGesture {
                                getDetail(id: historyObserved.history?[index].id ?? "")
                            }
                    }
                    
                } else {
                    Text("No history")
                }
            }
            
            NavigationLink(destination: historyDetailView(historyDetail: historyDetailObserved), isActive: $isShow) {
                EmptyView()
            }
            
            .onAppear {
                getHistory()
            }
            Spacer()
        }
        .navigationBarHidden(true)
        .padding()
        
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct historyRow: View {
    var image: String = ""
    var orderID: String = ""
    var total: Double = 0.0
    var date: String = ""
    var body: some View {
        HStack {
            let url = URL(string: image)
            let processor = ResizingImageProcessor(referenceSize: .init(width: 80, height: 80), mode: .aspectFit)
            KFImage.url(url)
                .placeholder({
                    HStack{
                        ProgressView()
                    }
                    .padding()
                    .frame(width: 80, height: 80)
                })
                .setProcessor(processor)
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in
                    print("SUCCESS LOAD IMAGE",result)
                }
                .onFailure { error in print("ERROR LOAD IMAGE",error) }
                .resizable()
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 15) {
                Text("Order id: \(orderID)")
                    .font(.system(size: 18, weight: .semibold, design: .serif))
                    .frame(alignment: .leading)
                    .foregroundColor(Color.gray)
                
                Text("Date: \(date)")
            }
            
            Spacer()
            Text(String(format: "Total: %.2f฿", total))
                .bold()
        }
    }
}

struct MyOrder_Previews: PreviewProvider {
    static var previews: some View {
        MyOrder()
    }
}

struct dateFormat {
    func stringToDate(date:String) -> Date {
        let formatter = DateFormatter()
        
        // Format 1
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        // Format 2
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        // Couldn't parsed with any format. Just get the date
        let splitedDate = date.components(separatedBy: "T")
        if splitedDate.count > 0 {
            formatter.dateFormat = "yyyy-MM-dd"
            if let parsedDate = formatter.date(from: splitedDate[0]) {
                return parsedDate
            }
        }
        
        // Nothing worked!
        return Date()
    }
}
