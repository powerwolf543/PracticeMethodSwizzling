//
//  SubBViewController.m
//  MethodSwizzling
//
//  Created by NixonShih on 2017/8/15.
//  Copyright © 2017年 NixonShih. All rights reserved.
//

#import "SubBViewController.h"

@interface SubBViewController ()

@end

@implementation SubBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
}

@end
