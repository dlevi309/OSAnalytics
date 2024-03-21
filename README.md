### Tweak to enhance crashlogs on iOS.

**tldr:** Adds a “`Filtered syslog`” section which spits out app-specific events up until the crash, see [here](https://haste.zneix.eu/fodycasare)

## Diff

Both crashes are triggered through the same event, 

Jump to [Before](#before) [After](#after)

#### Before

```
{"app_name":"AppStore","timestamp":"2024-03-20 19:40:02.00 -0700","app_version":"3.0","slice_uuid":"42e81d34-ce92-3fc6-a08f-5a992fc33091","adam_id":0,"build_version":"1","platform":2,"bundleID":"com.apple.AppStore","share_with_app_devs":0,"is_first_party":1,"bug_type":"109","os_version":"iPhone OS 14.4 (18D52)","incident_id":"F6A57458-D556-4905-A5E9-070C005196FA","name":"AppStore"}
Incident Identifier: F6A57458-D556-4905-A5E9-070C005196FA
CrashReporter Key:   b82d5bf2fb6a81523d38ae3bec816bc2f81f6ef7
Hardware Model:      iPhone13,4
Process:             AppStore [5190]
Path:                /Applications/AppStore.app/AppStore
Identifier:          com.apple.AppStore
Version:             1 (3.0)
Code Type:           ARM-64 (Native)
Role:                Foreground
Parent Process:      launchd [1]
Coalition:           com.apple.AppStore [1275]


Date/Time:           2024-03-20 19:39:54.5638 -0700
Launch Time:         2024-03-20 19:39:34.6017 -0700
OS Version:          iPhone OS 14.4 (18D52)
Release Type:        User
Baseband Version:    1.42.03
Report Version:      104

Exception Type:  EXC_BREAKPOINT (SIGTRAP)
Exception Codes: 0x0000000000000001, 0x000000010472beb8
Termination Signal: Trace/BPT trap: 5
Termination Reason: Namespace SIGNAL, Code 0x5
Terminating Process: exc handler [5190]
Triggered by Thread:  0

Thread 0 name:  Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   AppStore                      	0x000000010472beb8 0x1044a0000 + 2670264
1   CoreFoundation                	0x0000000183eb68f4 __invoking___ + 148
2   CoreFoundation                	0x0000000183d8ddf8 -[NSInvocation invoke] + 448
3   libFLEX.dylib                 	0x000000010689f128 0x106800000 + 651560
4   libFLEX.dylib                 	0x0000000106899d10 0x106800000 + 630032
5   UIKitCore                     	0x000000018686de78 -[UIApplication sendAction:to:from:forEvent:] + 100
6   UIKitCore                     	0x0000000185dce87c -[UIBarButtonItem _triggerActionForEvent:] + 180
7   UIKitCore                     	0x0000000185da607c __45-[_UIButtonBarTargetAction _invoke:forEvent:]_block_invoke + 40
8   UIKitCore                     	0x0000000185da5f2c -[_UIButtonBarTargetAction _invoke:forEvent:] + 204
9   UIKitCore                     	0x000000018686de78 -[UIApplication sendAction:to:from:forEvent:] + 100
10  UIKitCore                     	0x00000001861a4ef0 -[UIControl sendAction:to:forEvent:] + 208
11  UIKitCore                     	0x00000001861a5244 -[UIControl _sendActionsForEvents:withEvent:] + 356
12  UIKitCore                     	0x00000001861a3aa8 -[UIControl touchesEnded:withEvent:] + 536
13  UIKitCore                     	0x00000001868ac4e4 -[UIWindow _sendTouchesForEvent:] + 988
14  UIKitCore                     	0x00000001868ade4c -[UIWindow sendEvent:] + 3976
15  UIKitCore                     	0x00000001868871d4 -[UIApplication sendEvent:] + 712
16  UIKit                         	0x00000001cfbacc74 -[UIApplicationAccessibility sendEvent:] + 100
17  UIKitCore                     	0x00000001869110ec __dispatchPreprocessedEventFromEventQueue + 7360
18  UIKitCore                     	0x00000001869140a4 __processEventQueue + 6460
19  UIKitCore                     	0x000000018690b550 __eventFetcherSourceCallback + 160
20  CoreFoundation                	0x0000000183e2d76c __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 28
21  CoreFoundation                	0x0000000183e2d668 __CFRunLoopDoSource0 + 208
22  CoreFoundation                	0x0000000183e2c960 __CFRunLoopDoSources0 + 268
23  CoreFoundation                	0x0000000183e26a8c __CFRunLoopRun + 824
24  CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
25  GraphicsServices              	0x000000019b9f2784 GSEventRunModal + 164
26  UIKitCore                     	0x0000000186866ee8 -[UIApplication _run] + 1072
27  UIKitCore                     	0x000000018686c75c UIApplicationMain + 168
28  AppStore                      	0x00000001044b63ec 0x1044a0000 + 91116
29  libdyld.dylib                 	0x0000000183ae66b0 start + 4

Thread 1:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 2:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 3 name:  com.apple.uikit.eventfetch-thread
Thread 3:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   Foundation                    	0x00000001850d5df0 -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 232
6   Foundation                    	0x00000001850d5cbc -[NSRunLoop(NSRunLoop) runUntilDate:] + 92
7   UIKitCore                     	0x000000018691ac48 -[UIEventFetcher threadMain] + 516
8   Foundation                    	0x0000000185247a34 __NSThread__start__ + 864
9   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
10  libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 4 name:  AVAudioSession Notify Thread
Thread 4:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   AudioSession                  	0x000000018b96f0c4 GenericRunLoopThread::Entry(void*) + 164
6   AudioSession                  	0x000000018b97125c CAPThread::Entry(CAPThread*) + 92
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 5 name:  JavaScriptCore bmalloc scavenger
Thread 5:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   libc++.1.dylib                	0x0000000198f6d3c4 std::__1::condition_variable::__do_timed_wait(std::__1::unique_lock<std::__1::mutex>&, std::__1::chrono::time_point<std::__1::chrono::system_clock, std::__1::chrono::duration<long long, std::__1::ratio<1l, 1000000000l> > >) + 100
3   JavaScriptCore                	0x000000018e20cd00 bmalloc::Scavenger::threadRunLoop() + 552
4   JavaScriptCore                	0x000000018e20c7b4 bmalloc::Scavenger::Scavenger(std::__1::scoped_lock<bmalloc::Mutex> const&) + 0
5   JavaScriptCore                	0x000000018e20dccc std::__1::__thread_specific_ptr<std::__1::__thread_struct>::set_pointer(std::__1::__thread_struct*) + 0
6   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
7   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 6 name:  JetEngine.RunLoopWorkerThread[JetEngine.JSStack.scheduler]
Thread 6:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   JetEngine                     	0x000000019dc95720 0x19db59000 + 1296160
6   JetEngine                     	0x000000019dbb1308 0x19db59000 + 361224
7   JetEngine                     	0x000000019dc956e8 0x19db59000 + 1296104
8   JetEngine                     	0x000000019dc95818 0x19db59000 + 1296408
9   libswiftObjectiveC.dylib      	0x00000001aa357f30 autoreleasepool<A>(invoking:) + 64
10  JetEngine                     	0x000000019dc93dec 0x19db59000 + 1289708
11  JetEngine                     	0x000000019db9f1e8 0x19db59000 + 287208
12  Foundation                    	0x0000000185247a34 __NSThread__start__ + 864
13  libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
14  libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 7:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 8:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 9:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000105090000   x1: 0x00000002842b4b00   x2: 0x0000000000000007   x3: 0xc51fb88193caccdc
    x4: 0x00000000000062dc   x5: 0x0000000000000020   x6: 0x0078000004210143   x7: 0x0000000000000001
    x8: 0x000000000000007f   x9: 0x0000000000000017  x10: 0x00000000000007fb  x11: 0x00000000000007fd
   x12: 0x0000000000000001  x13: 0x00000000b061005f  x14: 0x00000000b0810800  x15: 0x0000000000000021
   x16: 0x0000000080000000  x17: 0x0000000030800000  x18: 0x0000000116ac7f1c  x19: 0x0000000280d65180
   x20: 0x00000001d8bd5b68  x21: 0x2868d88198ec80e0  x22: 0x0000000108c207b0  x23: 0x0000000108c20670
   x24: 0x00000001d374c27c  x25: 0x0000000000000000  x26: 0x000000010694fee0  x27: 0x00000001068dffde
   x28: 0x0000000000000002   fp: 0x000000016b95cde0   lr: 0xcb55fe010472beb8
    sp: 0x000000016b95cde0   pc: 0x000000010472beb8 cpsr: 0x60000000
   esr: 0xf2000001  Address size fault

Binary Images:
*removed this section for brevity*

Error Formulating Crash Report:
Symbolication has been requested by preference.

EOF
```

#### After

```
{"app_name":"AppStore","timestamp":"2024-03-20 19:51:49.00 -0700","app_version":"3.0","slice_uuid":"42e81d34-ce92-3fc6-a08f-5a992fc33091","adam_id":0,"build_version":"1","platform":2,"bundleID":"com.apple.AppStore","share_with_app_devs":0,"is_first_party":1,"bug_type":"109","os_version":"iPhone OS 14.4 (18D52)","incident_id":"A0B3704C-7F69-485F-8E6D-4E547AAFDDAD","name":"AppStore"}
Incident Identifier: A0B3704C-7F69-485F-8E6D-4E547AAFDDAD
CrashReporter Key:   b82d5bf2fb6a81523d38ae3bec816bc2f81f6ef7
Hardware Model:      iPhone13,4
Device Model:        D54pAP
Process:             AppStore [6492]
Path:                /Applications/AppStore.app/AppStore
Identifier:          com.apple.AppStore
Version:             1 (3.0)
Code Type:           ARM-64 (Native)
Role:                Foreground
Parent Process:      launchd [1]
Coalition:           com.apple.AppStore [1275]


Date/Time:           2024-03-20 19:51:42.3488 -0700
Launch Time:         2024-03-20 19:51:28.5695 -0700
OS Version:          iPhone OS 14.4 (18D52)
Release Type:        User
Baseband Version:    1.42.03
UDID:                00008101-000E245814E9001E
Report Version:      104

Exception Type:  EXC_BREAKPOINT (SIGTRAP)
Exception Codes: 0x0000000000000001, 0x00000001004ffeb8
Termination Signal: Trace/BPT trap: 5
Termination Reason: Namespace SIGNAL, Code 0x5
Terminating Process: exc handler [6492]
Triggered by Thread:  0

Application Specific Information:
Fatal error: Use of unimplemented initializer 'init(nibName:bundle:)' for class 'AppStore.ArcadeWelcomeViewController'

Thread 0 name:  Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   AppStore                      	0x00000001004ffeb8 0x100274000 + 2670264
1   CoreFoundation                	0x0000000183eb68f4 __invoking___ + 148
2   CoreFoundation                	0x0000000183d8ddf8 -[NSInvocation invoke] + 448
3   libFLEX.dylib                 	0x0000000100a6f128 0x1009d0000 + 651560
4   libFLEX.dylib                 	0x0000000100a69d10 0x1009d0000 + 630032
5   UIKitCore                     	0x000000018686de78 -[UIApplication sendAction:to:from:forEvent:] + 100
6   UIKitCore                     	0x0000000185dce87c -[UIBarButtonItem _triggerActionForEvent:] + 180
7   UIKitCore                     	0x0000000185da607c __45-[_UIButtonBarTargetAction _invoke:forEvent:]_block_invoke + 40
8   UIKitCore                     	0x0000000185da5f2c -[_UIButtonBarTargetAction _invoke:forEvent:] + 204
9   UIKitCore                     	0x000000018686de78 -[UIApplication sendAction:to:from:forEvent:] + 100
10  UIKitCore                     	0x00000001861a4ef0 -[UIControl sendAction:to:forEvent:] + 208
11  UIKitCore                     	0x00000001861a5244 -[UIControl _sendActionsForEvents:withEvent:] + 356
12  UIKitCore                     	0x00000001861a3aa8 -[UIControl touchesEnded:withEvent:] + 536
13  UIKitCore                     	0x00000001868ac4e4 -[UIWindow _sendTouchesForEvent:] + 988
14  UIKitCore                     	0x00000001868ade4c -[UIWindow sendEvent:] + 3976
15  UIKitCore                     	0x00000001868871d4 -[UIApplication sendEvent:] + 712
16  UIKit                         	0x00000001cfbacc74 -[UIApplicationAccessibility sendEvent:] + 100
17  UIKitCore                     	0x00000001869110ec __dispatchPreprocessedEventFromEventQueue + 7360
18  UIKitCore                     	0x00000001869140a4 __processEventQueue + 6460
19  UIKitCore                     	0x000000018690b550 __eventFetcherSourceCallback + 160
20  CoreFoundation                	0x0000000183e2d76c __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 28
21  CoreFoundation                	0x0000000183e2d668 __CFRunLoopDoSource0 + 208
22  CoreFoundation                	0x0000000183e2c960 __CFRunLoopDoSources0 + 268
23  CoreFoundation                	0x0000000183e26a8c __CFRunLoopRun + 824
24  CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
25  GraphicsServices              	0x000000019b9f2784 GSEventRunModal + 164
26  UIKitCore                     	0x0000000186866ee8 -[UIApplication _run] + 1072
27  UIKitCore                     	0x000000018686c75c UIApplicationMain + 168
28  AppStore                      	0x000000010028a3ec 0x100274000 + 91116
29  libdyld.dylib                 	0x0000000183ae66b0 start + 4

Thread 1 name:  com.apple.uikit.eventfetch-thread
Thread 1:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   Foundation                    	0x00000001850d5df0 -[NSRunLoop(NSRunLoop) runMode:beforeDate:] + 232
6   Foundation                    	0x00000001850d5cbc -[NSRunLoop(NSRunLoop) runUntilDate:] + 92
7   UIKitCore                     	0x000000018691ac48 -[UIEventFetcher threadMain] + 516
8   Foundation                    	0x0000000185247a34 __NSThread__start__ + 864
9   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
10  libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 2 name:  AVAudioSession Notify Thread
Thread 2:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   AudioSession                  	0x000000018b96f0c4 GenericRunLoopThread::Entry(void*) + 164
6   AudioSession                  	0x000000018b97125c CAPThread::Entry(CAPThread*) + 92
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 3 name:  JavaScriptCore bmalloc scavenger
Thread 3:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   libc++.1.dylib                	0x0000000198f6d3c4 std::__1::condition_variable::__do_timed_wait(std::__1::unique_lock<std::__1::mutex>&, std::__1::chrono::time_point<std::__1::chrono::system_clock, std::__1::chrono::duration<long long, std::__1::ratio<1l, 1000000000l> > >) + 100
3   JavaScriptCore                	0x000000018e20cd00 bmalloc::Scavenger::threadRunLoop() + 552
4   JavaScriptCore                	0x000000018e20c7b4 bmalloc::Scavenger::Scavenger(std::__1::scoped_lock<bmalloc::Mutex> const&) + 0
5   JavaScriptCore                	0x000000018e20dccc std::__1::__thread_specific_ptr<std::__1::__thread_struct>::set_pointer(std::__1::__thread_struct*) + 0
6   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
7   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 4 name:  JetEngine.RunLoopWorkerThread[JetEngine.JSStack.scheduler]
Thread 4:
0   libsystem_kernel.dylib        	0x00000001b1de22d0 mach_msg_trap + 8
1   libsystem_kernel.dylib        	0x00000001b1de1660 mach_msg + 76
2   CoreFoundation                	0x0000000183e2cc30 __CFRunLoopServiceMachPort + 380
3   CoreFoundation                	0x0000000183e26c14 __CFRunLoopRun + 1216
4   CoreFoundation                	0x0000000183e2621c CFRunLoopRunSpecific + 600
5   JetEngine                     	0x000000019dc95720 0x19db59000 + 1296160
6   JetEngine                     	0x000000019dbb1308 0x19db59000 + 361224
7   JetEngine                     	0x000000019dc956e8 0x19db59000 + 1296104
8   JetEngine                     	0x000000019dc95818 0x19db59000 + 1296408
9   libswiftObjectiveC.dylib      	0x00000001aa357f30 autoreleasepool<A>(invoking:) + 64
10  JetEngine                     	0x000000019dc93dec 0x19db59000 + 1289708
11  JetEngine                     	0x000000019db9f1e8 0x19db59000 + 287208
12  Foundation                    	0x0000000185247a34 __NSThread__start__ + 864
13  libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
14  libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 5 name:  JIT Worklist Helper Thread
Thread 5:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 6 name:  Heap Helper Thread
Thread 6:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 7 name:  Heap Helper Thread
Thread 7:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 8 name:  Heap Helper Thread
Thread 8:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 9 name:  Heap Helper Thread
Thread 9:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 10 name:  Heap Helper Thread
Thread 10:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 11 name:  DFG Worklist Worker Thread
Thread 11:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 12 name:  DFG Worklist Worker Thread
Thread 12:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 13:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 14 name:  FTL Worklist Worker Thread
Thread 14:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 15:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 16:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 17:
0   libsystem_pthread.dylib       	0x00000001cf968764 start_wqthread + 0

Thread 18 name:  JSC Heap Collector Thread
Thread 18:
0   libsystem_kernel.dylib        	0x00000001b1e061ac __psynch_cvwait + 8
1   libsystem_pthread.dylib       	0x00000001cf963468 _pthread_cond_wait + 1192
2   JavaScriptCore                	0x000000018e195dfc WTF::ParkingLot::parkConditionallyImpl(void const*, WTF::ScopedLambda<bool ()> const&, WTF::ScopedLambda<void ()> const&, WTF::TimeWithDynamicClockType const&) + 2780
3   JavaScriptCore                	0x000000018da559bc bool WTF::Condition::waitUntil<WTF::Lock>(WTF::Lock&, WTF::TimeWithDynamicClockType const&) + 196
4   JavaScriptCore                	0x000000018e162470 WTF::Detail::CallableWrapper<WTF::AutomaticThread::start(WTF::AbstractLocker const&)::$_0, void>::call() + 208
5   JavaScriptCore                	0x000000018e1ba028 WTF::Thread::entryPoint(WTF::Thread::NewThreadContext*) + 316
6   JavaScriptCore                	0x000000018e1bcd00 WTF::wtfThreadEntryPoint(void*) + 16
7   libsystem_pthread.dylib       	0x00000001cf95fcb0 _pthread_start + 320
8   libsystem_pthread.dylib       	0x00000001cf968778 thread_start + 8

Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x00000001008e0000   x1: 0x000000028289e180   x2: 0x0000000000000007   x3: 0xc51fb88193caccdc
    x4: 0x00000000000062dc   x5: 0x0000000000000020   x6: 0x0078000004210143   x7: 0x0000000000000001
    x8: 0x000000000000007f   x9: 0x0000000000000044  x10: 0x00000000000007fb  x11: 0x00000000000007fd
   x12: 0x0000000000000001  x13: 0x00000000b402c03e  x14: 0x00000000b422c800  x15: 0x0000000000000059
   x16: 0x0000000080000000  x17: 0x0000000034200000  x18: 0x000000010d8c7f1c  x19: 0x000000028249d810
   x20: 0x00000001d8bd5b68  x21: 0x2868d88198ec80e0  x22: 0x000000013161ab30  x23: 0x000000013161a9f0
   x24: 0x00000001d374c27c  x25: 0x0000000000000000  x26: 0x0000000100b1fee0  x27: 0x0000000100aaffde
   x28: 0x0000000000000002   fp: 0x000000016fb88de0   lr: 0xb50a0a01004ffeb8
    sp: 0x000000016fb88de0   pc: 0x00000001004ffeb8 cpsr: 0x60000000
   esr: 0xf2000001  Address size fault

Binary Images:
*removed this section for brevity*

Error Formulating Crash Report:
Symbolication has been requested by preference.

Filtered syslog:
Timestamp                         Type Thread  Act Process[pid] (Sender)
2024-03-20 19:51:39.1580 -0700    info 0x3619f 0x129455 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:39.1741 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.1741 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.1745 -0700    info 0x3619f 0x129457 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:39.1747 -0700    info 0x3619f 0x129457 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:39.1908 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.1908 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.1912 -0700    info 0x3619f 0x129459 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:39.1914 -0700    info 0x3619f 0x129459 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:39.2044 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.2044 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.2049 -0700    info 0x3619f 0x12945b AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:39.2051 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.2051 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.2061 -0700    info 0x3619f 0x12945b AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:39.9688 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.9688 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.9812 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.9812 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:39.9923 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2024-03-20 19:51:39.9926 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:39.9926 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0091 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0091 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0096 -0700    info 0x3619f 0x129461 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0099 -0700    info 0x3619f 0x129461 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.0259 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0259 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0264 -0700    info 0x3619f 0x129465 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0266 -0700    info 0x3619f 0x129465 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.0426 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0426 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0431 -0700    info 0x3619f 0x129467 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0434 -0700    info 0x3619f 0x129467 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.0593 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0593 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0598 -0700    info 0x3619f 0x129469 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0600 -0700    info 0x3619f 0x129469 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.0761 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0761 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0765 -0700    info 0x3619f 0x12946b AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0768 -0700    info 0x3619f 0x12946b AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.0927 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.0927 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.0932 -0700    info 0x3619f 0x12946d AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.0934 -0700    info 0x3619f 0x12946d AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1095 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1095 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1101 -0700    info 0x3619f 0x12946f AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1104 -0700    info 0x3619f 0x12946f AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1261 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1261 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1267 -0700    info 0x3619f 0x129471 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1270 -0700    info 0x3619f 0x129471 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1429 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1429 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1434 -0700    info 0x3619f 0x129473 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1437 -0700    info 0x3619f 0x129473 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1595 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1595 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1600 -0700    info 0x3619f 0x129475 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1602 -0700    info 0x3619f 0x129475 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1762 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1762 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1767 -0700    info 0x3619f 0x129477 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1770 -0700    info 0x3619f 0x129477 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.1929 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.1929 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.1934 -0700    info 0x3619f 0x129479 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.1937 -0700    info 0x3619f 0x129479 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2097 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2097 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.2102 -0700    info 0x3619f 0x12947b AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.2104 -0700    info 0x3619f 0x12947b AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2262 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2263 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.2267 -0700    info 0x3619f 0x12947d AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.2269 -0700    info 0x3619f 0x12947d AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2430 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2430 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.2435 -0700    info 0x3619f 0x12947f AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.2437 -0700    info 0x3619f 0x12947f AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2598 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2598 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.2603 -0700    info 0x3619f 0x129491 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.2605 -0700    info 0x3619f 0x129491 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2764 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2764 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.2769 -0700    info 0x3619f 0x129493 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.2772 -0700    info 0x3619f 0x129493 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.2981 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.2981 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.6527 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.6527 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.7339 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:40.7339 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:40.8281 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:40.8329 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:40.8735 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2024-03-20 19:51:40.8735 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:40.8736 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:40.8736 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:40.8738 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:41.2415 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:41.2461 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:41.3982 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1000) (null)
2024-03-20 19:51:41.3999 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:41.4033 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1000) error:0 data:<private>
2024-03-20 19:51:41.4036 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:41.4625 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:41.4626 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:41.4955 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2024-03-20 19:51:41.5516 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:41.5517 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:41.5716 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1044) (null)
2024-03-20 19:51:41.5997 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1044) error:0 data:<private>
2024-03-20 19:51:41.5997 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:41.5998 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:41.9655 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1001) (null)
2024-03-20 19:51:41.9687 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1001) error:0 data:<private>
2024-03-20 19:51:42.1090 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Attempting to send notification:  (1000) (null)
2024-03-20 19:51:42.1101 -0700    info 0x3619f 0x0 AppStore[6492] (UIAccessibility): Did post notification. notification:  (1000) error:0 data:<private>
2024-03-20 19:51:42.1645 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:42.1645 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:42.2358 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Dispatching UIEvent type: 0; subtype: 0; backingtype: 11, shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2024-03-20 19:51:42.2358 -0700    info 0x3619f 0x0 AppStore[6492] (UIKitCore): Sending UIEvent type: 0; subtype: 0; to windows: 1
2024-03-20 19:51:42.2366 -0700 default 0x3619f 0x12949a AppStore[6492] (libswiftCore.dylib): Fatal error: Use of unimplemented initializer 'init(nibName:bundle:)' for class 'AppStore.ArcadeWelcomeViewController'

EOF
```

### Note:

unredacting `<private>` message sections within the crashlog can be enabled through [this](https://github.com/EthanArbuckle/unredact-private-os_logs), and symbolicating crashlogs by default can be enabled through [this](https://github.com/dlevi309/Symbolicator)