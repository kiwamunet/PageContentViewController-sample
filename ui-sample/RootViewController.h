//
//  ViewController.h
//  ui-sample
//
//  Created by suzuki_kiwamu on 11/11/14.
//  Copyright (c) 2014 suzuki_kiwamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"


@interface RootViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;

@end

