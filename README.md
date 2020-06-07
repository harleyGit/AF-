# AFNetwork的源码分析和解读
#pod 'AFNetworking', '4.0.1'

AFNetworking主要是对NSURLSession和NSURLConnection(iOS9.0废弃)的封装,其中主要有以下类:


> 1). 网络通信模块:   AFHTTPRequestOperationManager: 内部封装的是 NSURLConnection, 负责发送网络请求, 使用最多的一个类(3.0废弃);

> 2). 网络通信模块:   AFHTTPSessionManager: 内部封装是 NSURLSession, 负责发送网络请求,使用最多的一个类。

> 3). 网络状态监听模块：AFNetworkReachabilityManager: 实时监测网络状态的工具类。当前的网络环境发生改变之后,这个工具类就可以检测到。

>4).网络通信安全策略模块： AFSecurityPolicy: 网络安全的工具类, 主要是针对 HTTPS 服务。

> 5). AFURLRequestSerialization: 序列化工具类,基类。上传的数据转换成JSON格式(AFJSONRequestSerializer).使用不多。

> 6). AFURLResponseSerialization: 反序列化工具类;基类.使用比较多:

> 7). AFJSONResponseSerializer: JSON解析器,默认的解析器.

> 8). AFHTTPResponseSerializer: 万能解析器; JSON和XML之外的数据类型,直接返回二进制数据.对服务器返回的数据不做任何处理.

> 9). AFXMLParserResponseSerializer: XML解析器;


># 基础语法
-   单例的创建方法
```
+ (instancetype)defaultInstance {
    static AFImageDownloader *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

```

<br/>
-   weakSelf与strongSelf的用法
```
//weakSelf避免循环引用
__weak __typeof(self)weakSelf = self;
AFNetworkReachabilityStatusCallback callback = ^(AFNetworkReachabilityStatus status) {
    //strongSelf保证block内部执行过程中self不会被释放
    __strong __typeof(weakSelf)strongSelf = weakSelf;

    strongSelf.networkReachabilityStatus = status;
    if (strongSelf.networkReachabilityStatusBlock) {
        strongSelf.networkReachabilityStatusBlock(status);
    }

    return strongSelf;
};

```


<br/>



# AFNetworking 



># SDWebImage 
<br/>
`**参考资料：**`
[SDWebImage源码解析](https://blog.csdn.net/weixin_39624536/article/details/93195493)



># RxSwift
<br/>
[RxSwift核心逻辑分析](https://www.jianshu.com/p/aeb0017e7adb)





<br/>
***
<br/>
># HTTP 和 HTTPS
SSL协议工作在应用层与传输层之间；
[HTTP与HTTPS 简介](https://www.jianshu.com/p/da6af12f412e)
[HTTPS 加密过程](https://blog.csdn.net/qq_32998153/article/details/80022489)









