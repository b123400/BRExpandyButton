//
//  BRExpandyButton.h
//  BRExpandyButtonExample
//
//  Created by b123400 on 25/1/13.
//  Copyright (c) 2013 b123400. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRExpandyButton : UIView{
    UIImage *image;
    NSArray *buttons;
    UIButton *selectedButton;
    BOOL expanded;
    
    UIImageView *imageView;
    UIView *buttonsContainer;
}
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSArray *buttons;
@property (nonatomic,strong) UIButton *selectedButton;
@property (nonatomic) BOOL expaned;

@end
