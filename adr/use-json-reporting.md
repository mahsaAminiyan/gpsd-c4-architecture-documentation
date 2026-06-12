# Use JSON Reporting

## Status

Accepted

## Context

GPSD needs to send structured navigation reports from the daemon to client applications. The original reporting protocol used limited one-letter request and response identifiers.

As GPSD gained more features and supported more sensor types, the old protocol became difficult to extend. It eventually ran out of useful namespace.

GPSD needs a reporting format that is structured, extensible, and usable by applications written in different programming languages.

## Decision

Use JSON as the reporting format for GPSD reports.

GPSD maps report types to JSON objects and identifies report types using a `class` attribute. This allows new report types and structured data fields to be added more easily.

## Consequences

### Positive

- JSON reports are structured and human-readable.
- New report types can be added more easily.
- Reports can contain strings, numbers, Boolean values, and structured data.
- JSON is language-independent and works well with different client languages.
- Client libraries can hide JSON details from applications.

### Negative

- JSON parsing is more expensive than parsing a very simple custom protocol.
- The JSON parser adds more implementation code.
- More code can create more places for defects.
- In C, JSON parsing must be carefully designed to avoid reliability problems related to dynamic memory allocation.