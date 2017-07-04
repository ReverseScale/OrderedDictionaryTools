//
//  NSDictionary+OrderDictionary.m
//  OrderedDictionaryTools
//
//  Created by WhatsXie on 2017/5/17.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "NSDictionary+OrderDictionary.h"

@implementation NSDictionary (OrderDictionary)
//在.m文件中将声明的方法实现
- (NSArray *)nk_ascendingComparedAllKeys {
        NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        return allKeys;
    }
    
- (NSArray *)nk_descendingComparedAllKeys {
        NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        return allKeys;
    }
@end
