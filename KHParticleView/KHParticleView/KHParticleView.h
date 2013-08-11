//
//  KHParticleView.h
//  ParticleDesignerForUIKit
//
//  Created by Khanh Huy on 8/11/13.
//  Copyright (c) 2013 Khanh Huy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "KHParticleLayer.h"

@interface CCDirector (transparent)

@end

@interface KHParticleView : UIView
{

}
@property (retain) KHParticleLayer* particleLayer;

@end
