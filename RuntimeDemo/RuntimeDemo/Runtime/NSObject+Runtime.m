//
//  NSObject+Runtime.m
//  RuntimeDemo
//
//  Created by dev on 2018/3/22.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

#pragma mark ---
#pragma mark --- 获取某个实例的属性列表 ---
+ (NSMutableArray *)propertiesInfoWithInstance:(id)instance{
    
    NSMutableArray *propertieAry = [NSMutableArray array];
    
    unsigned int outCount, i;
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [propertieAry addObject:propertyName];
        
    }
    
    free(properties);
    
    return propertieAry;
    
}

#pragma mark ---
#pragma mark --- 获取某个类的成员变量列表 ---
+ (NSMutableArray *)ivarInfoWithInstance:(id)instance{
    
    NSMutableArray *ivarInfoAry = [NSMutableArray array];
    unsigned int count, i;
    
    Ivar *ivars = class_copyIvarList([instance class], &count);
    for (i = 0 ; i < count ; i ++ ) {

        NSString *name = [NSString stringWithCString:ivar_getName(ivars[i]) encoding:NSUTF8StringEncoding];
        [ivarInfoAry addObject:name];
    }
    free(ivars);
    return ivarInfoAry;
    
}

#pragma mark ---
#pragma mark --- 获取某个类的方法列表 ---
+ (NSMutableArray *)methodListWithInstance:(id)instance{
    
    NSMutableArray *methodListAry = [NSMutableArray array];
    unsigned int count, i;
    
    Method *methods = class_copyMethodList([instance class], &count);
    for (i = 0 ; i < count; i ++) {
        SEL name = method_getName(methods[i]);
        NSString *methodStr = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [methodListAry addObject:methodStr];
    }
    free(methods);
    return methodListAry;
    
}


#pragma mark -
#pragma mark --- 检测对象的某个属性是否存在 ---
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    return NO;
}

#pragma mark ---
#pragma mark --- IMP指针替换系统方法 ---
+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString{
    //获取系统方法IMP
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemMethodString));
    //自定义方法的IMP
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(safeMethodString));
    //IMP相互交换，方法的实现也就互相交换了
    method_exchangeImplementations(safeMethod,sysMethod);
}

#pragma mark ---
#pragma mark --- 给系统类动态添加属性 ---

- (void)setName:(NSString *)name{
    /*
     objc_setAssociatedObject 将某个值跟某个对象关联起来，将某个值存储到某个对象中。
     object: 给哪个对象添加属性
     key:属性的名称
     value: 属性值
     policy:保存策略
     */
//    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    /*
     object:对象
     key:属性的名称
     */
//    objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
    return objc_getAssociatedObject(self, @"name");
}


@end
