//
//  ViewController.h
//  PageViewDemo
//
//  Created by Caleb on 7/21/14.
//  Copyright (c) 2014 USM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

/*
 * In order to make UIPageViewController work, we must adopt the UIPageViewControllerDataSource protocol. The data source for a page view controller is responsible for providing the content view controllers on demand. By implementing the data source protocol, we tell the page view controller what to display for each page.

 * In this case, we use the ViewController class as the data source for the UIPageViewController instance. Therefore it is necessary to declare the ViewController class as implementing the UIPageViewControllerDataSource protocol.

 * The ViewController class is also responsible to provide the data of the page content (i.e. images and titles).
 */

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkThrough:(id)sender;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end

