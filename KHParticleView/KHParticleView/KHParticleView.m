//
//  KHParticleView.m
//  ParticleDesignerForUIKit
//
//  Created by Khanh Huy on 8/11/13.
//  Copyright (c) 2013 Khanh Huy. All rights reserved.
//

#import "KHParticleView.h"

@implementation CCDirector (transparent)

// MUST overide this method to transparent gl view
-(void) setGLDefaultValues
{
	// This method SHOULD be called only after __view was initialized
	NSAssert( __view, @"__view must be initialized");
    
	[self setAlphaBlending: YES];
	[self setDepthTest: __view.depthFormat];
	[self setProjection: _projection];
    
	// set other opengl default values
//	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    self.view.opaque = NO;
}

@end

@implementation KHParticleView
static int sssParticleViewNum = 0;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled = NO;
        sssParticleViewNum++;
        if (sssParticleViewNum > 1) {
            NSLog(@"You should create one view use cocos2d");
        }
        [self setupCocos2d];
    }
    return self;
}
- (void) setupCocos2d
{
    CCGLView *glView = [CCGLView viewWithFrame:self.bounds
                                   pixelFormat:kEAGLColorFormatRGBA8
								   depthFormat:0
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0
                        ];
    
    glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    glView.userInteractionEnabled = NO;
    [self addSubview:glView];
    
    CCDirector* director_ = [CCDirector sharedDirector];
    
    [director_ setProjection:kCCDirectorProjection2D];
    [director_ setView:glView];
    
    [director_ enableRetinaDisplay:YES];
    
    CCScene *scene = [CCScene node];
    self.particleLayer = [[KHParticleLayer alloc] init];;
    [scene addChild:self.particleLayer];
    
    [director_ runWithScene:scene];
}

@end
