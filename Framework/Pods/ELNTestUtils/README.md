###Описание

Утилиты для облегчения написания тестов.

###Подключение

Через CocoaPods:

```
source 'https://github.com/elegion/ios-podspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'ELNTestUtils'
```

###Использование

```objective-c
- (void)testExpectationNoCompletion
{
    [self eln_expectationWithDescription:@"Test1" timeout:5 block:^(XCTestExpectation * _Nonnull expectation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [expectation fulfill];
        });
    }];
}

- (void)testExpectationSimpleCompletion
{
    [self eln_expectationWithDescription:@"Test2" timeout:5 block:^(XCTestExpectation * _Nonnull expectation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [expectation fulfill];
        });
    } completion:^(NSError * _Nullable error) {
        NSLog(@"Completion");
    }];
}

- (void)testExpectationNilCompletion
{
    [self eln_expectationWithDescription:@"Test2" timeout:5 block:^(XCTestExpectation * _Nonnull expectation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [expectation fulfill];
        });
    } completion:nil];
}
```
