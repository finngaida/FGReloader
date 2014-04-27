//
//  FGViewController.m
//  Epic Reload Thingy
//
//  Created by Finn Gaida on 06.08.13.
//  Copyright (c) 2013 Finn Gaida. All rights reserved.
//

#import "FGViewController.h"

@implementation FGViewController
@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [scrollView setDelegate:self];
    scrollView.contentSize = CGSizeMake(320, 900);
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    
    borderSize = 50;
    
    borderView = [[UIView alloc] initWithFrame:CGRectMake(320/2-borderSize/2, -(borderSize+10), borderSize, borderSize)];
    borderView.layer.masksToBounds = YES;
    borderView.layer.cornerRadius = borderView.frame.size.width/2;;
    borderView.layer.borderColor = [UIColor whiteColor].CGColor;
    borderView.layer.borderWidth = 3;
    borderView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:borderView];
    
    resizedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, borderSize, borderSize)];
    resizedView.layer.masksToBounds = YES;
    resizedView.layer.cornerRadius = resizedView.frame.size.width/2;;
    resizedView.backgroundColor = [UIColor whiteColor];
    [borderView addSubview:resizedView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sv {
    
    CGFloat o = -sv.contentOffset.y*.7;
    resizedView.frame = CGRectMake(o, o, borderSize-2*o, borderSize-2*o);
    resizedView.layer.cornerRadius = resizedView.frame.size.width/2;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)sv willDecelerate:(BOOL)decelerate {
    
    CGFloat o = -sv.contentOffset.y*.7;
    if (o>=50) {
        
        [UIView animateWithDuration:.5 animations:^{
            borderView.frame = CGRectMake(0, -195, 320, 320);
            resizedView.frame = CGRectMake(0, 0, 320, 320);
        }];
        [UIView animateWithDuration:.3 animations:^{
            borderView.alpha = 0;
        }];
        
        // reload
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    borderView.frame = CGRectMake(320/2-borderSize/2, -(borderSize+10), borderSize, borderSize);
    resizedView.frame = CGRectMake(0, 0, 50, 50);
    borderView.alpha = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
