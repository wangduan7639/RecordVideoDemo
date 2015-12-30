//
//  RecordVideoConfig.h
//  RecordVideoDemo
//
//  Created by wd on 15/12/30.
//  Copyright © 2015年 wd. All rights reserved.
//

#ifndef RecordVideoConfig_h
#define RecordVideoConfig_h

#define KColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//Document目录
#define PATH_OF_DOCUMENT         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//Video file time length limitation (Maximum Seconds)
#define VIDEO_MAX_TIME       60.0
//Video file time length limitation (Minimum Seconds)
#define VIDEO_VALID_MINTIME  8.0
//Video filename
#define VIDEO_DEFAULTNAME    @"RecordVideo/videoReadyToUpload.mp4"
//Video filepath
#define VIDEO_OUTPUTFILE     [NSURL fileURLWithPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:VIDEO_DEFAULTNAME]]

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width

#endif /* RecordVideoConfig_h */
