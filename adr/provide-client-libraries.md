# Provide Client Libraries

## Status

Accepted

## Context

GPSD exposes navigation data through a JSON-based reporting protocol. If applications communicated directly with this protocol, application developers would need to understand protocol details and implement their own protocol handling.

This would increase coupling between GPSD and client applications. It would also make protocol evolution more difficult, because changes in the protocol could require changes in many client applications.

GPSD needs to provide a stable and convenient interface for application developers.

## Decision

Provide client libraries for languages such as C, C++, and Python.

These libraries hide the details of the JSON reporting protocol and expose a more stable API to client applications.

## Consequences

### Positive

- Client applications can use a stable API instead of directly handling the protocol.
- Protocol details are hidden from application developers.
- Protocol changes can be isolated inside the client libraries.
- Duplicated client-side protocol handling is reduced.
- Application development becomes easier.

### Negative

- Client libraries must be maintained.
- Bugs in a client library may affect multiple applications.
- API design mistakes can be difficult to change later.