//
//  OrderDic.m
//  OrderedDictionaryTools
//
//  Created by WhatsXie on 2017/5/17.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "OrderDic.h"
#import "NSDictionary+OrderDictionary.h"

@implementation OrderDic
+ (NSMutableDictionary *)order:(NSDictionary *)dic {
    
    
    NSMutableDictionary *muDic = [NSMutableDictionary dictionary];
    
    __block int i = 0;
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSUserDefaults*userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:obj forKey:[NSString stringWithFormat:@"%d",i]];
        [userDefaults synchronize];
        
        i++;
    }];
    
    
    for (int i = 0 ; i < dic.count; i ++) {
        NSString *nStr = [NSString stringWithFormat:@"%d",i];
        NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
        
        muDic[nStr] = [userDefaultes stringForKey:nStr];
    }
    
    
    [muDic nk_descendingComparedAllKeys];
    return muDic;
}
@end
