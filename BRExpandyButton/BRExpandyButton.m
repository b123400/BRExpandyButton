//
//  BRExpandyButton.m
//  BRExpandyButtonExample
//
//  Created by b123400 on 25/1/13.
//  Copyright (c) 2013 b123400. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "BRExpandyButton.h"


@interface BRExpandyButton ()

-(void)layout;

-(void)tapped:(UITapGestureRecognizer*)recognizer;

@end

@implementation BRExpandyButton
@synthesize image,buttons,expaned,selectedButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.clipsToBounds=YES;
        self.layer.cornerRadius=self.frame.size.height/2;
        self.layer.borderWidth=1;
        self.layer.borderColor=[[UIColor colorWithWhite:0 alpha:0.3] CGColor];
        self.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.5];
        imageView=[[UIImageView alloc] init];
        imageView.userInteractionEnabled=NO;
        [self addSubview:imageView];
        
        buttonsContainer=[[UIView alloc] init];
        buttonsContainer.userInteractionEnabled=NO;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)]];
        [self addSubview:buttonsContainer];
    }
    return self;
}

-(void)setButtons:(NSArray *)_buttons{
    for(UIButton *thisButton in self.buttons){
        [thisButton removeTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [thisButton removeFromSuperview];
    }
    buttons=_buttons;
    for(UIButton *thisButton in self.buttons){
        if(![thisButton isKindOfClass:[UIButton class]]){
            NSLog(@"object in buttons must be UIButton");
            continue;
        }
        [thisButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [buttonsContainer addSubview:thisButton];
    }
    if(buttons.count){
        self.selectedButton=[buttons objectAtIndex:0];
    }
    [self layout];
}
-(void)setImage:(UIImage *)_image{
    image=_image;
    imageView.image=image;
}
-(void)setExpaned:(BOOL)_expaned{
    if(expaned!=_expaned){
        expaned=_expaned;
        [UIView animateWithDuration:0.5 animations:^{
            [self layout];
        }];
    }
    expaned=_expaned;
    if(expaned){
        buttonsContainer.userInteractionEnabled=YES;
    }else{
        buttonsContainer.userInteractionEnabled=NO;
    }
}
#pragma mark - layout
-(void)layoutSubviews{
    [super layoutSubviews];
    [self layout];
}
-(void)layout{
    float imageviewY=(self.frame.size.height-imageView.image.size.height)/2;
    imageView.frame=CGRectMake(imageviewY, imageviewY, imageView.image.size.width, imageView.image.size.height);
    float totalButtonWidth=0;
    for(UIButton *thisButton in self.buttons){
        if(!thisButton.superview){
            [buttonsContainer addSubview:thisButton];
        }
        if(self.expaned){
            thisButton.frame=CGRectMake(totalButtonWidth, (self.frame.size.height-thisButton.frame.size.height)/2, thisButton.frame.size.width, thisButton.frame.size.height);
            thisButton.layer.opacity=1.0;
            totalButtonWidth+=thisButton.frame.size.width;
        }else{
            thisButton.frame=CGRectMake(0, (self.frame.size.height-thisButton.frame.size.height)/2, thisButton.frame.size.width, thisButton.frame.size.height);
            if(thisButton==self.selectedButton){
                thisButton.layer.opacity=1.0;
                totalButtonWidth=thisButton.frame.size.width;
            }else{
                thisButton.layer.opacity=0.0;
            }
        }
    }
    buttonsContainer.frame=CGRectMake(imageView.frame.origin.x+imageView.frame.size.width, 0, totalButtonWidth, self.frame.size.height);
    CGRect frame=self.frame;
    frame.size.width=buttonsContainer.frame.origin.x+buttonsContainer.frame.size.width;
    self.frame=frame;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - user interaction
-(void)tapped:(UITapGestureRecognizer*)recognizer{
    if(recognizer.state==UIGestureRecognizerStateEnded){
        self.expaned=!self.expaned;
    }
}
-(void)buttonTapped:(id)sender{
    self.selectedButton=sender;
    self.expaned=!self.expaned;
}

@end
