workspace "GPSD Architecture" "C4 documentation for the GPSD suite" {

    model {
        user = person "Client Application / User" "Uses GPSD to access navigation and timekeeping data."

        sensors = softwareSystem "Navigation Sensors" "GPS, AIS, compass, or other navigation-related sensors." "External"
        correctionServers = softwareSystem "DGPS / NTRIP Correction Servers" "Provide differential GPS correction updates." "External"
        hotplugSystem = softwareSystem "Hotplug System" "Notifies GPSD when sensor devices are added or removed." "External"

        gpsdSuite = softwareSystem "GPSD Suite" "Suite of tools for managing GPS devices and navigation-related sensors." {

            daemon = container "gpsd service daemon" "Main runtime process that manages sensors and publishes reports to clients." "C" {
                multiplexer = component "Multiplexer" "Handles client sessions, device assignment, client commands, and hotplug notifications." "C"
                coreLibrary = component "Core Library" "Manages sensor sessions and selects the correct driver based on packet type." "C"
                packetSniffer = component "Packet Sniffer" "State machine that extracts and identifies packets from raw input streams." "C"
                drivers = component "Drivers" "User-space device drivers that parse packet payloads and extract time-position-velocity or status information." "C"
            }

            clientLibraries = container "Client libraries" "Libraries for C, C++, Python, and other bindings that hide JSON protocol details from client applications." "C / C++ / Python"

            diagnosticTools = container "Diagnostic tools" "Tools such as gpsmon, gpsprof, gpsctl, and gpsdecode for monitoring, profiling, configuring, and decoding sensor data." "C / Python"

            testTools = container "Test tools" "Testing and regression tools, especially gpsfake, which replays sensor logs as live devices." "Python / C"
        }

        user -> clientLibraries "Uses API"
        user -> daemon "May communicate directly over TCP/IP"
        user -> diagnosticTools "Uses for monitoring or debugging"

        clientLibraries -> daemon "Communicate with daemon and receive reports"
        diagnosticTools -> daemon "Monitor, configure, or decode sensor data"
        testTools -> daemon "Replay sensor logs for regression testing"

        daemon -> sensors "Reads raw sensor data"
        correctionServers -> daemon "Provide correction updates"
        hotplugSystem -> daemon "Sends device add/remove notifications"

        multiplexer -> coreLibrary "Opens sensors and manages sessions"
        coreLibrary -> packetSniffer "Uses to identify packet type"
        coreLibrary -> drivers "Selects driver based on packet type"
        drivers -> coreLibrary "Updates per-device session data"
        coreLibrary -> multiplexer "Provides report-ready session data"
    }

    views {
        systemContext gpsdSuite "SystemContext" {
            include *
            autolayout lr
        }

        container gpsdSuite "ContainerView" {
            include *
            autolayout lr
        }

        component daemon "GpsdDaemonComponentView" {
            include *
            autolayout lr
        }

        theme default
    }
}
