eadarak@eadarak-latitude-7490:~$ lscpu //affiche les informations du processeurs
Architecture :                              x86_64
  Mode(s) opératoire(s) des processeurs :   32-bit, 64-bit
  Address sizes:                            39 bits physical, 48 bits virtual
  Boutisme :                                Little Endian
Processeur(s) :                             8
  Liste de processeur(s) en ligne :         0-7
Identifiant constructeur :                  GenuineIntel
  Nom de modèle :                           Intel(R) Core(TM) i7-8650U CPU @ 1.9
                                            0GHz
    Famille de processeur :                 6
    Modèle :                                142
    Thread(s) par cœur :                    2
    Cœur(s) par socket :                    4
    Socket(s) :                             1
    Révision :                              10
    Vitesse maximale du processeur en MHz : 4200,0000
    Vitesse minimale du processeur en MHz : 400,0000
    BogoMIPS :                              4199.88
    Drapaux :                               fpu vme de pse tsc msr pae mce cx8 a
                                            pic sep mtrr pge mca cmov pat pse36 
                                            clflush dts acpi mmx fxsr sse sse2 s
                                            s ht tm pbe syscall nx pdpe1gb rdtsc
                                            p lm constant_tsc art arch_perfmon p
                                            ebs bts rep_good nopl xtopology nons
                                            top_tsc cpuid aperfmperf pni pclmulq
                                            dq dtes64 monitor ds_cpl vmx smx est
                                             tm2 ssse3 sdbg fma cx16 xtpr pdcm p
                                            cid sse4_1 sse4_2 x2apic movbe popcn
                                            t tsc_deadline_timer aes xsave avx f
                                            16c rdrand lahf_lm abm 3dnowprefetch
                                             cpuid_fault epb invpcid_single pti 
                                            ssbd ibrs ibpb stibp tpr_shadow vnmi
                                             flexpriority ept vpid ept_ad fsgsba
                                            se tsc_adjust bmi1 avx2 smep bmi2 er
                                            ms invpcid mpx rdseed adx smap clflu
                                            shopt intel_pt xsaveopt xsavec xgetb
                                            v1 xsaves dtherm ida arat pln pts hw
                                            p hwp_notify hwp_act_window hwp_epp 
                                            md_clear flush_l1d arch_capabilities
Virtualization features:                    
  Virtualisation :                          VT-x
Caches (sum of all):                        
  L1d:                                      128 KiB (4 instances)
  L1i:                                      128 KiB (4 instances)
  L2:                                       1 MiB (4 instances)
  L3:                                       8 MiB (1 instance)
NUMA:                                       
  Nœud(s) NUMA :                            1
  Nœud NUMA 0 de processeur(s) :            0-7
Vulnerabilities:                            
  Itlb multihit:                            KVM: Mitigation: VMX disabled
  L1tf:                                     Mitigation; PTE Inversion; VMX condi
                                            tional cache flushes, SMT vulnerable
  Mds:                                      Mitigation; Clear CPU buffers; SMT v
                                            ulnerable
  Meltdown:                                 Mitigation; PTI
  Mmio stale data:                          Mitigation; Clear CPU buffers; SMT v
                                            ulnerable
  Retbleed:                                 Mitigation; IBRS
  Spec store bypass:                        Mitigation; Speculative Store Bypass
                                             disabled via prctl and seccomp
  Spectre v1:                               Mitigation; usercopy/swapgs barriers
                                             and __user pointer sanitization
  Spectre v2:                               Mitigation; IBRS, IBPB conditional, 
                                            RSB filling, PBRSB-eIBRS Not affecte
                                            d
  Srbds:                                    Mitigation; Microcode
  Tsx async abort:                          Mitigation; TSX disabled
  
eadarak@eadarak-latitude-7490:~$ lspci  //liste les peripheries pci
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers (rev 08)
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620 (rev 07)
00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller (rev 21)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-LP Thermal subsystem (rev 21)
00:15.0 Signal processing controller: Intel Corporation Sunrise Point-LP Serial IO I2C Controller #0 (rev 21)
00:15.1 Signal processing controller: Intel Corporation Sunrise Point-LP Serial IO I2C Controller #1 (rev 21)
00:15.2 Signal processing controller: Intel Corporation Sunrise Point-LP Serial IO I2C Controller #2 (rev 21)
00:15.3 Signal processing controller: Intel Corporation Sunrise Point-LP Serial IO I2C Controller #3 (rev 21)
00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CSME HECI #1 (rev 21)
00:17.0 RAID bus controller: Intel Corporation 82801 Mobile SATA Controller [RAID mode] (rev 21)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #1 (rev f1)
00:1c.2 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #3 (rev f1)
00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #5 (rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point LPC Controller/eSPI Controller (rev 21)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev 21)
00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (4) I219-LM (rev 21)
01:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader (rev 01)
02:00.0 Network controller: Intel Corporation Wireless 8265 / 8275 (rev 78)

eadarak@eadarak-latitude-7490:~$ lsusb //liste les peripheriques usb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 8087:0a2b Intel Corp. Bluetooth wireless interface
Bus 001 Device 002: ID 0bda:5650 Realtek Semiconductor Corp. Integrated Webcam_HD
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

eadarak@eadarak-latitude-7490:~$ lsmem
RANGE                                 SIZE    STATE REMOVABLE  BLOCK
0x0000000000000000-0x000000007fffffff   2G en ligne       oui   0-15 //une barrette
0x0000000100000000-0x000000047fffffff  14G en ligne       oui 32-143 //une barrette 

Taille du bloc mémoire :  128M
Mémoire partagée totale :   16G
Total offline memory:      0B

