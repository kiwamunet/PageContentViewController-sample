//
//  PageViewController.h
//  ui-sample
//
//  Created by suzuki_kiwamu on 11/11/14.
//  Copyright (c) 2014 suzuki_kiwamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property NSUInteger pageIndex;
@property NSString *titleText;

@end
