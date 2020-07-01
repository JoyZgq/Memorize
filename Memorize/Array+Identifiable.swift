//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by neo on 2020/7/1.
//  Copyright © 2020 Next-Skip. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable{
       func firstIndex(matching:Element) -> Int? {
           for index in 0..<self.count{
               if self[index].id == matching.id{
                   return index
               }
           }
           return nil//TODO
       }
   }
