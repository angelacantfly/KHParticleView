//
//  KHParticleLayer.h
//  ParticleDesignerForUIKit
//
//  Created by Khanh Huy on 8/11/13.
//  Copyright (c) 2013 Khanh Huy. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface KHParticleLayer : CCLayer

- (void) addParticleWithPlist:(NSString*) fileName atPoint:(CGPoint) p;
- (void) addMovingParticle;
@end
