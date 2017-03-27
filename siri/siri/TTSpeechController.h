//
//  TTSpeechController.h
//  siri
//
//  Created by LPPZ-User01 on 2017/3/12.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface TTSpeechController : NSObject

//创建一个语音合成器 （嘴）
@property (nonatomic, strong,readonly) AVSpeechSynthesizer *synthesizer;

//创建一个类方法来实例化控制器来控制嘴巴

+ (instancetype)speechController;

//文本转语音
- (void)beginSpe;

@end
