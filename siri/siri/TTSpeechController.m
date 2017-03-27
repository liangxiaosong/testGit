//
//  TTSpeechController.m
//  siri
//
//  Created by LPPZ-User01 on 2017/3/12.
//  Copyright © 2017年 LPPZ-User01. All rights reserved.
//

#import "TTSpeechController.h"


@interface TTSpeechController ()

@property (nonatomic, strong, readwrite)AVSpeechSynthesizer *synthesizer;

@property (nonatomic, strong,readwrite) NSArray *voices;


@property (nonatomic, strong,readwrite) NSArray *str;
@end

/*
 这是一个文本转语音的类
 */

@implementation TTSpeechController

+ (instancetype)speechController {
    return [[self alloc] init];
}

//重写 init 在里面对语音设置及对需要转化的文本进行一个初始化
- (instancetype)init {
    if (self = [super init]) {
        //嘴巴
        _synthesizer = [[AVSpeechSynthesizer alloc]
                        init];
        //语音合成 --- english -- 中文
        _voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];

        _str = [self buildSpee];

    }
    return self;
}

- (NSArray *)buildSpee {
    return @[@"hello",@"苍老师"];
}

- (void)beginSpe {
    //数组中有几个元素，你的说几次话
    for (int i = 0; i < self.str.count; i ++) {
        //舌头
        AVSpeechUtterance *utt = [[AVSpeechUtterance alloc] initWithString:self.str[i]];
        //舌头设置
        utt.voice = self.voices[i%2];//声音的大小
        utt.rate = 0.4;//速率 0~1
        utt.pitchMultiplier = 0.8;//音调
        //需要对其延时处理
        utt.postUtteranceDelay = 0.2;
        //书话
        [self.synthesizer speakUtterance:utt];
    }
}

@end
