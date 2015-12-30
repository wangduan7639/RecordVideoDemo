//
//  RecordVideoViewController.h
//  RecordVideoDemo
//
//  Created by wd on 15/12/30.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecordVideoViewControllerDelegate <NSObject>

- (void)finishRecordVideoCapture:(NSString *)filePath;

@end

@interface RecordVideoViewController : UIViewController

@property (nonatomic, weak) id<RecordVideoViewControllerDelegate> delegate;

@end
