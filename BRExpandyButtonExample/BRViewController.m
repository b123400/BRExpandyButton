//
//  BRViewController.m
//  BRExpandyButtonExample
//
//  Created by b123400 on 25/1/13.
//  Copyright (c) 2013 b123400. All rights reserved.
//

#import "BRViewController.h"
#import "BRExpandyButton.h"

@interface BRViewController ()

@end

@implementation BRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *autoButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [autoButton setTitle:@"auto" forState:UIControlStateNormal];
    [autoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGRect frame=autoButton.frame;
    frame.size.height=44;
    frame.size.width=60;
    autoButton.frame=frame;
    
    UIButton *onButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [onButton setTitle:@"on" forState:UIControlStateNormal];
    [onButton sizeToFit];
    [onButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    frame=onButton.frame;
    frame.size.height=44;
    frame.size.width=50;
    onButton.frame=frame;
    
    UIButton *offButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [offButton setTitle:@"off" forState:UIControlStateNormal];
    [offButton sizeToFit];
    [offButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    frame=offButton.frame;
    frame.size.height=44;
    frame.size.width=50;
    offButton.frame=frame;
    
    BRExpandyButton *expandButton=[[BRExpandyButton alloc] initWithFrame:CGRectMake(20, 20, 100, 34)];
    expandButton.buttons=@[autoButton,onButton,offButton];
    expandButton.image=[UIImage imageNamed:@"Lightning-32.png"];
    
    [self.view addSubview:expandButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
