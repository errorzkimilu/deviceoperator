#include <sys/utsname.h>

@interface SBTelephonyManager : NSObject

- (void)setOperatorName:(id)arg1;

@end

%hook SBTelephonyManager

- (void)setOperatorName:(id)arg1 {
	struct utsname u;
	uname(&u);
	const char *j = u.machine;
	NSString *str = [NSString stringWithUTF8String:j];
	%orig(str);
}

%end