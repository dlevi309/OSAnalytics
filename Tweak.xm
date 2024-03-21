#import <Foundation/Foundation.h>

extern "C" bool os_variant_has_internal_diagnostics(const char *subsystem);
%hookf(bool, os_variant_has_internal_diagnostics, const char *subsystem) {
    if(!strcmp(subsystem, "com.apple.OSAnalytics")) {
        return true;
    }
    return %orig;
}
