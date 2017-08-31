//
//  ViewController.m
//  AccuracyTest
//
//  Created by Dry on 2017/8/30.
//  Copyright © 2017年 Dry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSDecimalNumber是NSNumber的子类，是苹果针对浮点型计算时存在精度计算误差的问题而提供的一个类
    NSString *str1 = @"100.90";
    NSString *str2 = @"100.09";
    
    NSDecimalNumber *decimal1 = [NSDecimalNumber decimalNumberWithString:str1];
    NSDecimalNumber *decimal2 = [NSDecimalNumber decimalNumberWithString:str2];
    
    //加
    NSDecimalNumber *addDecimal = [decimal1 decimalNumberByAdding:decimal2];
    NSLog(@"%@",addDecimal);
    
    //减
    NSDecimalNumber *subtractDecimal = [decimal1 decimalNumberBySubtracting:decimal2];
    NSLog(@"%@",subtractDecimal);

    //乘
    NSDecimalNumber *multiplyDeciaml = [decimal1 decimalNumberByMultiplyingBy:decimal2];
    NSLog(@"%@",multiplyDeciaml);

    //除
    NSDecimalNumber *dividDecimal = [decimal1 decimalNumberByDividingBy:decimal2];
    NSLog(@"%@",dividDecimal);

    //次方运算
    NSDecimalNumber *raisingDecimal = [decimal1 decimalNumberByRaisingToPower:0];
    NSLog(@"%@",raisingDecimal);

    //10次方
    NSDecimalNumber *multiplyingByPowerOf10Decimal = [decimal1 decimalNumberByRaisingToPower:10];
    NSLog(@"%@",multiplyingByPowerOf10Decimal);
    
    
    //json字符串
    NSString *jsonString = @"{\"79.10\":79.10, \"97.40\":97.40, \"80.40\":80.40, \"188.40\":188.40,\"9.40\":9.40,\"8.70\":8.70,\"9.49\":9.49,\"9.7\":9.7}";
    //UTF8转码成二进制数据类型
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //NSJSONSerialization解析json
    NSError *error = nil;
    NSDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error]];
    if (!error)
    {   //解析成功，打印出结果
        NSLog(@"dic:%@", dic);
    }else {
        NSLog(@"json格式不正确，无法解析");
    }
    
    //接收
    float floatNum = [dic[@"97.40"] floatValue];
    NSString *string = [NSString stringWithFormat:@"%lf",floatNum];
    NSLog(@"%lf",floatNum);
    NSLog(@"%@",string);
    
    NSString *string2 = [NSString stringWithFormat:@"%.2f",floatNum];
    NSLog(@"%@",string2);

    
    //
    NSString *string3 = [self decimalNumberWithDouble:[dic[@"97.40"] doubleValue]];
    NSLog(@"%@",string3);
    double doubleNum = [self StringChangeToDoubleForJingdu:string3];
    NSLog(@"%f",doubleNum);

    
    /*
     1、float类型的两位数，而且是含有两位小数（两位以上或者一位都没问题），小数位第二位是0，十位数字是7、8、9
     2、float类型的一位数，各位是7、8、9，小数点后第一位是7、8、9
     */
}

/*
 *double －－－> NSString
 */
- (NSString *)decimalNumberWithDouble:(double)conversionValue {
    NSString *doubleString     = [NSString stringWithFormat:@"%lf",conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

/*
 *NSString －－－> double
 */
- (double)StringChangeToDoubleForJingdu:(NSString *)textString {
    if (textString == nil || [textString isEqualToString:@""]) {
        return 0.0;
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return  [[formatter numberFromString:textString]doubleValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
