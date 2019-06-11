#import "SuccessErrorOverlayPlugin.h"
#import <success_error_overlay/success_error_overlay-Swift.h>

@implementation SuccessErrorOverlayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSuccessErrorOverlayPlugin registerWithRegistrar:registrar];
}
@end
