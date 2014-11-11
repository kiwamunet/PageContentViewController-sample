//
//  ViewController.m
//  PageViewDemo
//
//  Created by Caleb on 7/21/14.
//  Copyright (c) 2014 USM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //  Create the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regulat Update"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    //  Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    //  I first create the PageViewController instance. Next I specify the data source, in this case it is the class itself. I then create the first page content controller, add it to an array of controllers and assign it to the page view controller for display.
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    // Change the size of the page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    
}


#pragma mark - Page View Controller Data Source

// First, we get the current page index. Depending the method, we simply increase/decrease the index number and return the view controller to display. Of course, we have to verify if we have reached the boundaries of the pages and return nil in that case.

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;

    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count])
    {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

//  viewControllerAtIndex: method is a helper method that is designed to create the page content view controller on demand. It takes in the index parameter and creates the corresponding page content controller.

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count]))
    {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    
   // I have set a storyboard ID for the view controllers when designing the user interface. The ID is used as reference for creating the view controller instance. To instantiate a view controller in storyboard, you can use the instantiateViewControllerWithIdentifier: method with a specific storyboard ID.
    
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

//To display a page indicator, you have to tell iOS the number of pages (i.e. dots) to display in the page view controller and which page must be selected at the beginning. Add the following two methods at the end of the ViewController.m file:

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

// I simply tell iOS that we have the total number of pages to display in the page view controller and the first page should be selected by default.

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkThrough:(id)sender
{
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}
@end
