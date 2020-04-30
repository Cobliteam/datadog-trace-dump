# datadog tracing dumper

datadog tracing dumper is a console utility that act as a datadog agent, printing tracing hierarchy on terminal.

It can be useful to debug traces structures

```
opentracing-dumper_1  | ####################
opentracing-dumper_1  | Trace alterado: 15090975169980406961
opentracing-dumper_1  |                                   ██████████████████████████
opentracing-dumper_1  |                                   █       akka.actor       █
opentracing-dumper_1  |                                   █         Shard:         █
opentracing-dumper_1  |                                   █  ProcessQueueContents  █
opentracing-dumper_1  |                                   █        0.242424        █
opentracing-dumper_1  |                                   ██████████████████████████
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     ∨
opentracing-dumper_1  |                                   ┌────────────────────────┐
opentracing-dumper_1  |                                   │       akka.actor       │
opentracing-dumper_1  |                                   │ DeviceActorSupervisor: │
opentracing-dumper_1  |                                   │  ProcessQueueContents  │
opentracing-dumper_1  |                                   │        0.162763        │
opentracing-dumper_1  |                                   └────────────────────────┘
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     ∨
opentracing-dumper_1  | ┌───────────────────────────┐     ┌────────────────────────────────────────────────────┐     ┌─────────────────┐
opentracing-dumper_1  | │        akka.actor         │     │                     akka.actor                     │     │   akka.actor    │
opentracing-dumper_1  | │ DeviceTotalDistanceActor: │     │                    DeviceActor:                    │     │ RiskEventActor: │
opentracing-dumper_1  | │          Compute          │     │                ProcessQueueContents                │     │     Compute     │
opentracing-dumper_1  | │         3.559862          │ <── │                      3.935019                      │ ──> │     0.57003     │
opentracing-dumper_1  | └───────────────────────────┘     └────────────────────────────────────────────────────┘     └─────────────────┘
opentracing-dumper_1  |                                     │                              │
opentracing-dumper_1  |                                     │                              │
opentracing-dumper_1  |                                     ∨                              ∨
opentracing-dumper_1  |                                   ┌────────────────────────┐     ┌─────────────────────┐
opentracing-dumper_1  |                                   │       akka.actor       │     │     akka.actor      │
opentracing-dumper_1  |                                   │   BackoffSupervisor:   │     │ DevicePluggedActor: │
opentracing-dumper_1  |                                   │        Compute         │     │       Compute       │
opentracing-dumper_1  |                                   │        0.167262        │     │      2.208635       │
opentracing-dumper_1  |                                   └────────────────────────┘     └─────────────────────┘
opentracing-dumper_1  |                                     │                              │
opentracing-dumper_1  |                                     │                              │
opentracing-dumper_1  |                                     ∨                              ∨
opentracing-dumper_1  |                                   ┌────────────────────────┐     ┌─────────────────────┐
opentracing-dumper_1  |                                   │                        │     │      process-       │
opentracing-dumper_1  |                                   │       akka.actor       │     │       device-       │
opentracing-dumper_1  |                                   │    DevicePathActor:    │     │       plugged       │
opentracing-dumper_1  |                                   │        Compute         │     │ DevicePluggedActor: │
opentracing-dumper_1  |                                   │        2.061841        │     │       Compute       │
opentracing-dumper_1  |                                   │                        │     │      6.484937       │
opentracing-dumper_1  |                                   └────────────────────────┘     └─────────────────────┘
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     ∨
opentracing-dumper_1  | ┌───────────────────────────┐     ┌────────────────────────┐     ┌─────────────────────┐
opentracing-dumper_1  | │         produce-          │     │        process-        │     │        save-        │
opentracing-dumper_1  | │          device-          │     │        device-         │     │       device-       │
opentracing-dumper_1  | │           path            │     │          path          │     │        path         │
opentracing-dumper_1  | │     DevicePathActor:      │     │    DevicePathActor:    │     │  DevicePathActor:   │
opentracing-dumper_1  | │          Compute          │     │        Compute         │     │       Compute       │
opentracing-dumper_1  | │         0.053728          │ <── │        6.462232        │ ──> │      0.032528       │
opentracing-dumper_1  | └───────────────────────────┘     └────────────────────────┘     └─────────────────────┘
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     │
opentracing-dumper_1  |                                     ∨
opentracing-dumper_1  |                                   ┌────────────────────────┐
opentracing-dumper_1  |                                   │       akka.actor       │
opentracing-dumper_1  |                                   │    DevicePathActor:    │
opentracing-dumper_1  |                                   │  SaveSnapshotSuccess   │
opentracing-dumper_1  |                                   │        0.334739        │
opentracing-dumper_1  |                                   └────────────────────────┘
opentracing-dumper_1  | ####################
```
