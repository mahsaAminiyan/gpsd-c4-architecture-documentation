# Use Layered Architecture

## Status

Accepted

## Context

The `gpsd` daemon must support different sensor types, packet formats, and client applications. It must detect packets, parse packet payloads, manage sensor sessions, and communicate with clients.

If all these responsibilities were implemented in one monolithic module, the daemon would become difficult to understand, test, and extend.

GPSD needs a structure that separates responsibilities and supports future sensor types.

## Decision

Structure the internal architecture of the `gpsd` daemon into four main components:

- Multiplexer
- Core Library
- Packet Sniffer
- Drivers

The packet sniffer identifies packet types in raw input streams. The core library manages sensor sessions and selects the correct driver. The drivers parse packet payloads and extract navigation or status information. The multiplexer manages client sessions, device assignment, client commands, and hotplug notifications.

## Consequences

### Positive

- Responsibilities are clearly separated.
- Packet detection is separated from packet interpretation.
- Device-specific parsing is separated from client communication.
- New device drivers can be added with limited impact on the rest of the system.
- Components can be tested and maintained more easily.

### Negative

- The architecture introduces additional internal interfaces.
- Developers must understand and respect the layer boundaries.