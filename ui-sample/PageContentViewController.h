//
//  PageViewController.h
//  PageViewDemo
//
//  Created by Caleb on 7/21/14.
//  Copyright (c) 2014 USM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// The pageIndex stores the current page index (or page number).  The view controller is designed to display an image and a title.
@property NSUInteger pageIndex;

// Two parameters for passing the title text and image file.
@property NSString *titleText;
@property NSString *imageFile;

@end
