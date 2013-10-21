//
//  main.m
//  NSArray
//
//  Created by Joe Gu on 13-5-20.
//  Copyright (c) 2013年 Joe Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    
    NSArray *array =[NSArray arrayWithObjects:@"gmq1",@"gmq2", @"gmq3",@"gmq4",nil];
    //如果要添加空的话可以用以下方法
    NSArray *array1=[NSArray arrayWithObjects:@"dancer",[NSNull null], nil];
    //同字符串一样，可以建立可变更的数组，并设置一个初始量。
    NSMutableArray *array2=[NSMutableArray arrayWithCapacity:50];
    //下面可以动态添加数组元素
    [array2 addObject:@"gmq1"];
    [array2 addObject:@"gmq2"];
    [array2 addObject:@"gmq3"];
    [array2 addObject:@"gmq4"];
    //合并字符串数组
    NSString *str = [array2 componentsJoinedByString:@"|"];
    NSLog(str);
    
    //字符串切割成数组
    NSArray *array3=[str componentsSeparatedByString:@"|"];
    NSLog(@"%@",array3);
    
    //可变数组元素删除
    [array2 removeObjectAtIndex:1];
    NSLog(@"%@",array2);
    
    
    
    
    //不可变数组添加
    NSMutableArray *gmqArray=[NSMutableArray arrayWithCapacity:0];
    [gmqArray addObject:@"gmq"];                              //添加字符串
    [gmqArray addObject:[NSNumber numberWithInt:29]];         //封装 添加整型
    [gmqArray addObject:[NSNumber numberWithFloat:19.89]];    //封装 添加浮点型
    [gmqArray addObject:[NSNumber numberWithBool:NO]];        //封装 添加布尔型
    
    
    
    //[gmqArray removeObjectAtIndex:0];      //移除数值0的数组元素
    //[gmqArray removeAllObjects];           //移除所有数组元素
    
    
    
    ////////////   封装
    int age=5;
    char c='A';                                 //'A'输出为ASCII编码 65
    float f=3.14159;
    NSRect rect =NSMakeRect(1, 2, 3, 4);              //struct类型的数据
    NSNumber *myAge = [NSNumber numberWithInt:age];
    NSNumber *myC = [NSNumber numberWithChar:c];      //C字符串 添加 'A'输出为ASCII编码 65      '%s C 字符串'
    NSNumber *myF= [NSNumber numberWithFloat:f];
    NSValue *value = [NSValue valueWithRect:rect];    //封装 struct类型的数据
    //NSNumber类的父类NSValue来进行包装，包装成NSValue的对象再将其放入数组中
    
    [gmqArray addObject:myAge];
    [gmqArray addObject:myC];
    [gmqArray addObject:myF];
    [gmqArray addObject:value];
    
    
    
    
    for (NSString *testGMQ in gmqArray )
    {
        NSLog(@"数组快速枚举 %@",testGMQ);
    }
    
     NSLog(@"count数量 %ld\n ",[gmqArray count]);  //gmqArray 数组中的数量
    
    
    ///////////////////        数组中大小排列 输出
    
    NSNumber *n1=[NSNumber numberWithInt:110];
    NSNumber *n2=[NSNumber numberWithInt:120];
    NSNumber *n3=[NSNumber numberWithInt:119];
    NSNumber *n4=[NSNumber numberWithInt:115];
    
    NSMutableArray *array4=[NSMutableArray arrayWithObjects:n1,n2,n3,n4,nil];
    
    for (int i=0; i < array4.count -1; i++)
    {
        for (int j = i+1;j < array4.count ; j++)
        {
            if ([[array4 objectAtIndex:i]compare:[array4 objectAtIndex:j]] >0 )
                //对于NSNumbers对象使用compare：时会自动转换成基本数据类型如：int..来比较
            {
                [array4 exchangeObjectAtIndex:i withObjectAtIndex:j]; //关键
                //用array4中第j个元素替换array4中第i个元素
            }
        }
    }
    
    
    for (NSString *gmqabc in array4 )
    {
        NSLog(@"数组大小排列输出  %@",gmqabc);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    NSMutableArray *arrA=[NSMutableArray arrayWithCapacity:0];
    
    for (int i=2; i<=20; i=i+2)
    {
        [arrA addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    for (NSString*tmpA in arrA )//快速枚举
    {
        NSLog(@"arrA   %@",tmpA);
    }
    NSLog(@"countA--- = %ld",[arrA count]);
    ///////////////////arrB复制arrA/////start////
    NSMutableArray *arrB=[NSMutableArray arrayWithArray:arrA];
    
    for (NSString*tmpB in arrB ) //////////// (id obj in arrB )
    {
        NSLog(@"arrB   %@",tmpB);//////////// (@"arrB   %@",obj)
    }
    NSLog(@"countB--- = %ld",[arrB count]);
    ///////////////////arrB复制arrA /////end///
    
    ///////////////////arrB中index奇数打印 /////start///
    /*
     
     NSMutableArray *arrC=[NSMutableArray arrayWithArray:arrB];
     
     for (int j=0; j<=20; j=j+4)
     {
     [arrC removeObject:[NSString stringWithFormat:@"%d",j]];
     }
     
     
     for (NSString*tmpC in arrC )
     {
     NSLog(@"arrC   %@",tmpC);
     }
     
     */
    
    NSMutableArray *arrC=[NSMutableArray arrayWithCapacity:0];
    // 构建循环，循环初始条件为第一个奇数项1，终止条件为arrB的count-1（即<arrB count）,迭代条件为2（每次取奇数项）
    for (int i = 1; i<[arrB count];i = i+2)
    {
        id obj = [arrB objectAtIndex:i];
        [arrC addObject:obj];
    }
    // 输出数组arrC
    NSLog(@"\n==== arrC ====\n");
    for(id obj in arrC)
    {
        NSLog(@"%@",obj);
    }
    
    NSLog(@"countC--- = %ld",[arrC count]);
    
    
    
    return 0;
}

