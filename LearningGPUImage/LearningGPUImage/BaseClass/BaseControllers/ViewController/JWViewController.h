//
//  JWViewController.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACReplaySubject;
@class RACSubject;

@interface JWViewController : UIViewController

@property (nonatomic, strong)RACSubject *subjectForClosed;
@property (nonatomic, strong)RACReplaySubject *replaySubjectForClosed;
@property (nonatomic, assign) BOOL topLineIsHidden;


@end
