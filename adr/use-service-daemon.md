# Use Service Daemon



## Status



Accepted



## Context



GPS devices and navigation-related sensors use many different application protocols. These protocols are often badly documented, device-specific, and highly variable across sensor types and models.



If each location-aware application had to communicate directly with GPS devices, every application would need to implement its own protocol handling, device management, and error handling. This would create duplicated, brittle, and hard-to-maintain code.



GPSD needs to hide device-specific complexity and provide applications with a simpler and more stable way to access navigation data.



## Decision



Use a central service daemon named `gpsd`.



The daemon manages connected navigation sensors, handles device-specific protocols, and makes reports from the sensors available to client applications through a common interface.



## Consequences



### Positive



- Client applications can access navigation data without knowing sensor protocol details.

- Device management and protocol handling are centralized in one place.

- Duplicated protocol-handling code is reduced.

- Multiple client applications can share the same sensor data.



### Negative



- The daemon becomes a central runtime dependency. If the daemon is not running or fails, client applications may lose access to navigation data. Therefor the daemon must be reliable and carefully tested.

