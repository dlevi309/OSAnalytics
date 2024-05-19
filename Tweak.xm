#import <Foundation/Foundation.h>

%hook OSASystemConfiguration

- (BOOL)appleInternal {
    return TRUE;
}

%end
