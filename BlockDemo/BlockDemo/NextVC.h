//
//  NextVC.h
//  BlockDemo
//
//  Created by dev on 2017/9/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SendMessage)(NSString *str);

@interface NextVC : UIViewController

@property (nonatomic, copy) SendMessage sendMessage;

@end
