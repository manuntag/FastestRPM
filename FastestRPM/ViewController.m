//
//  ViewController.m
//  FastestRPM
//
//  Created by David Manuntag on 2015-01-22.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *speedNeedle;

@property (strong, nonatomic) IBOutlet UILabel *speedLabel;


@property (nonatomic) NSInteger calculatedSPEED;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

   
    CGFloat angle = ((130 * M_PI)/180.0);
    
    self.speedNeedle.transform = CGAffineTransformMakeRotation(angle);
    
    
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                           action:@selector(gestureRecognizerRecord:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    
}

-(void)gestureRecognizerRecord:(UIPanGestureRecognizer*)panGestureRecognizer {
    
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    
    //min angle
    CGFloat angle = ((130 * M_PI)/180.0);
    
   
    // display speed
    
    self.calculatedSPEED = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y));
    
    self.speedLabel.text = [NSString stringWithFormat:@"%.2ld p/sec",(long)self.calculatedSPEED];
    
    
    //transform needle with animation
    
    NSInteger calcSpeed = self.calculatedSPEED * 0.0675;
    CGFloat angleWithSpeed = (((130 + calcSpeed)*M_PI)/180.0);

    
    [UIView animateWithDuration:2.0f
                         animations:^{ self.speedNeedle.transform = CGAffineTransformMakeRotation(angleWithSpeed);  }
                         completion:^(BOOL finished) {
            
    [UIView animateWithDuration:5.0f
                     animations:^{ self.speedNeedle.transform = CGAffineTransformMakeRotation(angle);
                     
                     }   completion:nil];
                         
            
                         }];

}

@end
