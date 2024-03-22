#import <Foundation/Foundation.h>

%hook OSASystemConfiguration

- (BOOL)appleInternal {
    return TRUE;
}

- (id)releaseType {
    return @"Internal";
}

- (id)systemId {
    return @"<internal>";
}

%end

%hook OSAProxyConfiguration

- (NSString *)releaseType {
    return @"Internal";
}

- (NSString *)targetAudience {
    return @"Internal";
}

%end
