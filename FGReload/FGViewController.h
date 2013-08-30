//
//  FGViewController.h
//  Epic Reload Thingy
//
//  Created by Finn Gaida on 06.08.13.
//  Copyright (c) 2013 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FGViewController : UIViewController <UIScrollViewDelegate> {
    
    UIView *borderView;
    UIView *resizedView;
    float borderSize;
    
}

@property UIScrollView *scrollView;

@end
