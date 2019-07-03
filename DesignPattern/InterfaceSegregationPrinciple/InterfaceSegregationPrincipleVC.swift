//
//  InterfaceSegregationPrincipleVC.swift
//  DesignPattern
//
//  Created by xiaoniu on 2019/7/3.
//  Copyright © 2019 com.xffoundation. All rights reserved.
//
//  客户端不应该依赖它不需要的接口，一个类对另一个类的依赖应该建立在最小的接口上
//  
//  不应该强迫客户依赖于它们不用的方法。接口属于客户，不属于它所在的类层次结构。

import UIKit

// 新手只有查询的资格
protocol OrderOperationForGreenHand {
    func select();
}

protocol OrderOperationForAdmin {
    func insertOrder()
    func select()
    func update()
    func delete()
}

class OrderOperation : OrderOperationForGreenHand,OrderOperationForAdmin {
    private init() {
        
    }
    
    class func operationForGreenHand() -> OrderOperationForGreenHand {
        return OrderOperation()
    }
    
    class func operationForAdmin() -> OrderOperationForAdmin {
        return OrderOperation()
    }
    
    func insertOrder() {
        print("增加订单")
    }
    
    func select() {
        print("查找订单")
    }
    
    func update() {
        print("更新订单")
    }
    
    func delete() {
        print("删除订单")
    }
}

class InterfaceSegregationPrincipleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // greedHand 只能调用 select()，其他的方法对他都不见。
        let greenHand = OrderOperation.operationForGreenHand()
        greenHand.select()
        
        // admin 可以调用增删改查四个方法
        let admin = OrderOperation.operationForAdmin();
        admin.insertOrder()
    }
}
