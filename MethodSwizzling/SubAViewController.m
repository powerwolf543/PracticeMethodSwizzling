//
//  Created by NixonShih on 2017/8/15.
//  Copyright © 2017 NixonShih. All rights reserved.
//

#import "SubAViewController.h"
#import <objc/runtime.h>

@interface SubAViewController ()

@end

@implementation SubAViewController

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = self;
        SEL originSelector = @selector(setTitle:);
        SEL swizzledSelector = @selector(swizzlingSetTitle:);
        Method originMethod = class_getInstanceMethod(class, originSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
       
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
}

- (void)swizzlingSetTitle:(NSString *)title {
    self.navigationItem.title = title;
    self.view.backgroundColor = [UIColor blueColor];
}

@end
