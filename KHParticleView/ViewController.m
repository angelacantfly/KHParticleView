//
//  ViewController.m
//  KHParticleView
//
//  Created by Khanh Huy on 8/11/13.
//  Copyright (c) 2013 Khanh Huy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton* btnTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnTest.frame = CGRectMake(15, 15, 250, 60);
    [btnTest setTitle:@"Tap to run particle" forState:UIControlStateNormal];
    [self.view addSubview:btnTest];
    [btnTest addTarget:self action:@selector(btnTestSelected:) forControlEvents:UIControlEventTouchUpInside];
    self.particleView = [[KHParticleView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_particleView];
}

- (void) btnTestSelected:(id) sender
{
    [self.particleView.particleLayer addMovingParticle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.particleView = nil;
}

@end
