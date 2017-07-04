//
//  NSDictionary+OrderDictionary.h
//  OrderedDictionaryTools
//
//  Created by WhatsXie on 2017/5/17.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (OrderDictionary)
/*****************获取升序键值*********************/
- (NSArray *)nk_ascendingComparedAllKeys;
    
/*****************获取降序键值*********************/
- (NSArray *)nk_descendingComparedAllKeys;
@end
