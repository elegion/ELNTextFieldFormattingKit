//
//  UIResponder+MFNHelpers.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 10.12.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

@import UIKit;

@interface UIResponder (ELNUtils)

/// @see http://stackoverflow.com/questions/5029267/is-there-any-way-of-asking-an-ios-view-which-of-its-children-has-first-responder/14135456#14135456
+ (__kindof UIResponder *)eln_currentFirstResponder;

@end
