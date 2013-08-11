//
//  KHParticleLayer.m
//  ParticleDesignerForUIKit
//
//  Created by Khanh Huy on 8/11/13.
//  Copyright (c) 2013 Khanh Huy. All rights reserved.
//

#import "KHParticleLayer.h"

@interface KHParticleLayer()
{
    CCParticleSystem* particleX;
}
@end

@implementation KHParticleLayer
- (void) addParticleWithPlist:(NSString*) fileName atPoint:(CGPoint) p
{
    CGPoint cocos2dPoint = CGPointMake(p.x, self.contentSize.height - p.y);
    CCParticleSystem* particle = [CCParticleSystemQuad particleWithFile:fileName];
    particle.position = cocos2dPoint;
    [self addChild:particle z:10];
}
- (void) addMovingParticle
{
    CGSize winSize = [CCDirector sharedDirector].winSize;
    if (particleX == nil) {
        particleX = [CCParticleSystemQuad particleWithFile:@"pTest2.plist"];
        particleX.position = ccp(winSize.width/2,0);
        [self addChild:particleX z:10];
    }
    [particleX runAction:[CCSequence actions:
                         [CCMoveTo actionWithDuration:2.5 position:ccp(winSize.width/2, winSize.height)],
                         [CCMoveTo actionWithDuration:2.5 position:ccp(winSize.width/2, 0)],
                         nil]];
}
@end
