module Ref {

  # ----------------------------------------------------------------------
  # Defaults
  # ----------------------------------------------------------------------

  module Default {

    constant queueSize = 10

    constant stackSize = 10 * 1024

  }

  # ----------------------------------------------------------------------
  # Active component instances
  # ----------------------------------------------------------------------

  instance blockDrv: Drv.BlockDriver base id 0x0100 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 140

  instance rateGroup1Comp: Svc.ActiveRateGroup base id 0x0200 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 120

  instance rateGroup2Comp: Svc.ActiveRateGroup base id 0x0300 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 119

  instance rateGroup3Comp: Svc.ActiveRateGroup base id 0x0400 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 118

  instance cmdDisp: Svc.CommandDispatcher base id 0x0500 \
    queue size 20 \
    stack size Default.stackSize \
    priority 101

  instance cmdSeq: Svc.CmdSequencer base id 0x0600 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 100

  instance fileDownlink: Svc.FileDownlink base id 0x0700 \
    queue size 30 \
    stack size Default.stackSize \
    priority 100

  instance fileManager: Svc.FileManager base id 0x0800 \
    queue size 30 \
    stack size Default.stackSize \
    priority 100

  instance fileUplink: Svc.FileUplink base id 0x0900 \
    queue size 30 \
    stack size Default.stackSize \
    priority 100

  instance pingRcvr: Ref.PingReceiver base id 0x0A00 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 100

  instance eventLogger: Svc.ActiveLogger base id 0x0B00 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 98

  instance chanTlm: Svc.TlmChan base id 0x0C00 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 97

  instance prmDb: Svc.PrmDb base id 0x0D00 \
    queue size Default.queueSize \
    stack size Default.stackSize \
    priority 96

  # ----------------------------------------------------------------------
  # Queued component instances
  # ----------------------------------------------------------------------

  instance $health: Svc.Health base id 0x2000 \
    queue size 25

  instance SG1: Ref.SignalGen base id 0x2100 \
    queue size Default.queueSize

  instance SG2: Ref.SignalGen base id 0x2200 \
    queue size Default.queueSize

  instance SG3: Ref.SignalGen base id 0x2300 \
    queue size Default.queueSize

  instance SG4: Ref.SignalGen base id 0x2400 \
    queue size Default.queueSize

  instance SG5: Ref.SignalGen base id 0x2500 \
    queue size Default.queueSize

  instance sendBuffComp: Ref.SendBuff base id 0x2600 \
    queue size Default.queueSize

  # ----------------------------------------------------------------------
  # Passive component instances
  # ----------------------------------------------------------------------

  @ Communications driver. May be swapped with other comm drivers like UART
  @ Note: Here we have TCP reliable uplink and UDP (low latency) downlink
  instance comm: Drv.ByteStreamDriverModel base id 0x4000 \
    at "../../Drv/TcpClient/TcpClient.hpp"

  instance downlink: Svc.Framer base id 0x4100

  instance fatalAdapter: Svc.AssertFatalAdapter base id 0x4200

  instance fatalHandler: Svc.FatalHandler base id 0x4300

  instance fileUplinkBufferManager: Svc.BufferManager base id 0x4400

  instance linuxTime: Svc.Time base id 0x4500 \
    at "../../Svc/LinuxTime/LinuxTime.hpp"

  instance rateGroupDriverComp: Svc.RateGroupDriver base id 0x4600

  instance recvBuffComp: Ref.RecvBuff base id 0x4700

  instance staticMemory: Svc.StaticMemory base id 0x4800

  instance textLogger: Svc.PassiveTextLogger base id 0x4900

  instance uplink: Svc.Deframer base id 0x4A00

}