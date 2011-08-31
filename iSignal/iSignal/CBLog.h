//
//  CBLog.h
//  iSignal
//
//  Created by Patrick Deng on 11-8-24.
//  Copyright 2011 CodeBeaver. All rights reserved.
//

#ifndef iSignal_CBLog_h
#define iSignal_CBLog_h


#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#endif
