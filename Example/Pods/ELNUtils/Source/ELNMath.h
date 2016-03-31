//
//  math.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 18.03.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

#if CGFLOAT_IS_DOUBLE
#define eln_round round
#define eln_ceil ceil
#define eln_floor floor
#define eln_fabs fabs
#define eln_exp exp
#define eln_sin sin
#else
#define eln_round roundf
#define eln_ceil ceilf
#define eln_floor floorf
#define eln_fabs fabsf
#define eln_exp expf
#define eln_sin sinf
#endif
