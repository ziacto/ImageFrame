//
//  ViewController.m
//  SGFocusImageFrame
//
//  Created by Shane Gao on 17/6/12.
//  Copyright (c) 2012 Shane Gao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)setupViews;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Demo";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
//	[UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleLightContent;
//	[self setNeedsStatusBarAppearanceUpdate];
    [self setupViews];
	self.automaticallyAdjustsScrollViewInsets = NO;
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//	return UIStatusBarStyleLightContent;
//}
//
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}

//- (void)setNeedsStatusBarAppearanceUpdate
//{
//	[self preferredStatusBarStyle];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


#pragma mark - 
- (void)setupViews
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:@"http://b.hiphotos.baidu.com/pic/w%3D310/sign=bbfe9e577af40ad115e4c1e2672d1151/eaf81a4c510fd9f966affc06242dd42a2834a421.jpg" tag:0];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:@"http://f.hiphotos.baidu.com/pic/w%3D310/sign=1a20a8a8b999a9013b355d372d940a58/f31fbe096b63f6246e704dbf8644ebf81a4ca358.jpg"  tag:1];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:@"http://a.hiphotos.baidu.com/pic/w%3D310/sign=b6f5dc9afcfaaf5184e387bebc5594ed/241f95cad1c8a786b1f93eb26609c93d71cf50be.jpg"  tag:2];
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:@"title4" image:@"http://h.hiphotos.baidu.com/pic/w%3D310/sign=0b7542b75ab5c9ea62f305e2e538b622/b90e7bec54e736d110c0f8b49a504fc2d46269be.jpg"  tag:4];
    
//    CGRect theFrame = CGRectMake(0, 100, self.view.bounds.size.width, 60.0);
//    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:theFrame
//                                                                    delegate:self
//															focusImageItems:item1, item2, item3, item4, nil];
//    [self.view addSubview:imageFrame];
    
    
    NSArray *imageItems = [NSArray arrayWithObjects:item1, item2, item3, item4, nil];
    SGFocusImageFrame *bottomImageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 193.f) delegate:self focusImageItemsArrray:imageItems];
    bottomImageFrame.autoScrolling = YES;
	bottomImageFrame.switchTimeInterval = 5.0f;
    [self.view addSubview:bottomImageFrame];
    
//    [self showGuidePictures];
}

- (void)showGuidePictures
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"photo1.jpg"] tag:1001];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"photo2.jpg"] tag:1002];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"photo3.jpg"] tag:1003];
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:@"title4" image:[UIImage imageNamed:@"photo4.jpg"] tag:1004];
    
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:[[UIScreen mainScreen] bounds] delegate:self focusImageItems:item1, item2, item3, item4, nil];
    
    imageFrame.switchTimeInterval = 5.f;
    
    [[[[UIApplication sharedApplication] delegate] window] addSubview:imageFrame];
}
#pragma mark -
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%d tapped", item.tag);
    
    if (item.tag == 1004) {
        [imageFrame removeFromSuperview];
    }
}
@end
