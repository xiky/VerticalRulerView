//
//  ViewController.m
//  RulerDemo
//
//  Created by gs_sh on 2017/12/18.
//  Copyright © 2017年 Remover. All rights reserved.
//

#import "ViewController.h"

#import "VerticalRuler.h"

#import "HorizontalRuler.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VerticalRuler *ruler = [[VerticalRuler alloc] initWithFrame:(CGRectMake(50, 100, 20, 300))];

    ruler.valueChanged = ^(CGFloat value, CGFloat persentageValue) {
        NSLog(@"value:%f == persentageValue:%f", value, persentageValue);
    };
    [self.view addSubview:ruler];
    
    
    HorizontalRuler *horRuler = [[HorizontalRuler alloc] initWithFrame:(CGRectMake(50, 450, 300, 10))];
    horRuler.valueChanged = ^(CGFloat value, CGFloat persentageValue) {
        NSLog(@"value:%f == persentageValue:%f", value, persentageValue);
    };
    [self.view addSubview:horRuler];
    
}

- (void)addProgressView{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
