//
//  ViewController.m
//  OrderedDictionaryTools
//
//  Created by WhatsXie on 2017/5/17.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "OrderDic.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *originalDicTextView;
@property (weak, nonatomic) IBOutlet UITextView *orderDicTextView;

@property (nonatomic, strong) NSDictionary *originalDicData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupStyle];
    
    self.originalDicData = @{@"amount":@"123",
                             @"bankcode":@"0100101",
                             @"callbackMode":@"DIR_CALL",
                             @"expired":@"YEEPAY",
                             @"expectPayCompany":@"20170516"
                             };
    
    self.originalDicTextView.text = [self dictionaryToJson:self.originalDicData];
    
}
- (IBAction)orderDicAction:(id)sender {
    self.orderDicTextView.textAlignment = NSTextAlignmentLeft;
    self.orderDicTextView.text = [self printWithDictionary:self.originalDicData];
}
- (void)setupStyle {
    self.originalDicTextView.layer.borderWidth = 0.5f;
    self.originalDicTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.originalDicTextView.layer.cornerRadius = 9;
    self.originalDicTextView.layer.masksToBounds = YES;

    self.orderDicTextView.layer.borderWidth = 0.5f;
    self.orderDicTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.orderDicTextView.layer.cornerRadius = 9;
    self.orderDicTextView.layer.masksToBounds = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.orderDicTextView setContentOffset:CGPointZero animated:NO];
}
- (NSString *)printWithDictionary:(NSDictionary *)dic {
    NSString *stringDic = [NSString stringWithFormat:@"{\namount = %@;\nbankcode = %@;\ncallbackMode = %@;\nexpired=%@;\nexpectPayCompany=%@\n}",
                           [[OrderDic order:dic] objectForKey:@"0"],
                           [[OrderDic order:dic] objectForKey:@"1"],
                           [[OrderDic order:dic] objectForKey:@"2"],
                           [[OrderDic order:dic] objectForKey:@"3"],
                           [[OrderDic order:dic] objectForKey:@"4"]];
    return stringDic;
}
//字典转json格式字符串：
- (NSString *)dictionaryToJson:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
