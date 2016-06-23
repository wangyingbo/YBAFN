//
//  YBAFN.h
//  Kergou
//
//  Created by 王迎博 on 16/6/13.
//  Copyright © 2016年 佳品. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "LXAlertView.h"

/**定义请求成功的block*/
typedef void(^requestSuccess)( NSDictionary * responseObject);

/**定义请求失败的block*/
typedef void(^requestFailure)( NSError *error);

/**定义上传进度block*/
typedef void(^uploadProgress)(CGFloat progress);


@interface YBAFN : NSObject


/**
 *  上传图片
 *
 *  @param baseUrlStr   baseUrlStr
 *  @param appendUrlStr appendUrlStr
 *  @param para         参数
 *  @param imageArray   图片数组
 *  @param successBlock 成功block
 *  @param failureBlock 失败block
 *  @param progress     上传进度
 */
+(void)UPDATA_baseUrlStr:(NSURL *)baseUrl
            appendUrlStr:(NSString *)appendUrlStr
              parameters:(NSDictionary *)para
            withImageArr:(NSArray *)imageArray
              sourceName:(NSArray *)nameArr
                fileName:(NSArray *)fileNameArr
                mimeType:(NSString *)type
        withSuccessBlock:(requestSuccess)successBlock
         withFailurBlock:(requestFailure)failureBlock
      withUpLoadProgress:(uploadProgress)progressUp;


/**
 *  自定义提醒
 *
 *  @param str   提醒文字
 *  @param style 动画风格
 */
+(void)YB_alertViewWithShowStr:(NSString *)str withStyle:(LXAShowAnimationStyle)style;


/**
 *  提醒
 *
 *  @param showStr    提醒文字
 *  @param style      风格
 *  @param indexBlock 位置
 */
+ (LXAlertView *)YB_alertViewContent:(NSString *)showStr WithStyle:(LXAShowAnimationStyle)style indexBlock:(void(^)(NSInteger btnIndex))indexBlock;

@end
