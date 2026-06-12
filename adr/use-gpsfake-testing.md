# Use gpsfake Testing

## Status

Accepted

## Context

GPSD supports many sensor devices, protocols, and packet formats. Testing only with physical GPS devices would be slow, expensive, and difficult to reproduce.

When a user reports a bug, developers need a way to reproduce the exact sensor behavior that caused the problem. GPSD also needs regression testing so that future changes do not break existing functionality.

## Decision

Use `gpsfake` as a test harness for the `gpsd` daemon.

`gpsfake` can connect `gpsd` to recorded sensor logs as if they were live devices. This allows developers to replay sensor data from bug reports and use recorded logs as part of the regression-test suite.

## Consequences

### Positive

- Bugs can be reproduced using recorded sensor logs.
- Regression testing becomes easier and more automated.
- Developers can modify code with less fear of breaking existing behavior.
- The project can demonstrate correctness, not only claim correctness.
- Testing supports the reliability goals of GPSD.

### Negative

- Sensor logs must be collected and maintained.
- Recorded logs may not cover every real-world device behavior.
- Testing with `gpsfake` does not completely replace testing with real devices.