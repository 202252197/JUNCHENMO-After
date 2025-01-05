package com.jcm.common.core.utils.system;

import com.alibaba.fastjson2.JSONObject;
import oshi.SystemInfo;
import oshi.hardware.*;
import oshi.software.os.*;
import oshi.util.FormatUtil;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * OSHI工具类
 * @author zhaohy
 *
 */
public class OshiUtil {

    /**
     * 主方法，用于演示如何使用OSHI库来获取和展示系统的各项信息
     *
     * @param args 命令行参数（在此处未实际使用）
     */
    public static void main(String[] args) {
        // 输出初始化系统的提示信息
        System.out.println("Initializing System...");
        // 创建SystemInfo实例，用于获取整个系统的信息
        SystemInfo si = new SystemInfo();

        // 获取硬件抽象层实例，用于访问硬件相关信息
        HardwareAbstractionLayer hal = si.getHardware();
        // 获取操作系统实例，用于访问操作系统相关信息
        OperatingSystem os = si.getOperatingSystem();

        // 输出操作系统相关信息（此处直接调用toString方法，具体展示内容取决于OSHI库对操作系统信息的封装格式）
        System.out.println(os);

        // 检查并输出计算机系统相关信息
        System.out.println("Checking computer system...");
        printComputerSystem(hal.getComputerSystem());

        // 检查并输出处理器相关信息
        System.out.println("Checking Processor...");
        printProcessor(hal.getProcessor());

        // 检查并输出内存相关信息
        System.out.println("Checking Memory...");
        printMemory(hal.getMemory());

        // 检查并输出系统进程相关信息
        System.out.println("Checking Processes...");
        getProcesses(os, hal.getMemory());

        // 检查并输出电源相关信息
        System.out.println("Checking Power sources...");
        printPowerSources(hal.getPowerSources());

        // 检查并输出磁盘相关信息
        System.out.println("Checking Disks...");
        printDisks(hal.getDiskStores());

        // 检查并输出文件系统相关信息
        System.out.println("Checking File System...");
        getFileSystem(os.getFileSystem());

        // 检查并输出网络接口相关信息
        System.out.println("Checking Network interfaces...");
        printNetworkInterfaces(hal.getNetworkIFs());

        // 检查并输出网络参数相关信息
        System.out.println("Checking Network parameterss...");
        printNetworkParameters(os.getNetworkParams());

    }

    /**
     * 打印计算机系统相关信息的方法，包括制造商、型号、序列号以及固件、主板等详细信息
     *
     * @param computerSystem 计算机系统对象，包含了计算机硬件的基础信息
     */
    private static void printComputerSystem(final ComputerSystem computerSystem) {
        // 输出计算机系统制造商信息  MECHREVO
        System.out.println("manufacturer: " + computerSystem.getManufacturer());
    }

    /**
     * 打印处理器相关信息的方法，包括物理CPU包数量、物理CPU核心数量、逻辑CPU数量以及处理器标识符等信息
     *
     * @param processor 中央处理器对象，包含了处理器相关的详细信息
     */
    public static void printProcessor(CentralProcessor processor) {
        // 输出处理器对象的相关信息（此处直接调用toString方法，具体展示内容取决于OSHI库对处理器信息的封装格式）AMD Ryzen 9 5900HX with Radeon Graphics
        System.out.println(processor);
        // 输出物理CPU包的数量 1 physical CPU package(s)
        System.out.println(" " + processor.getPhysicalPackageCount() + " physical CPU package(s)");
        // 输出物理CPU核心的数量 8 physical CPU core(s)
        System.out.println(" " + processor.getPhysicalProcessorCount() + " physical CPU core(s)");
        // 输出逻辑CPU的数量  16 logical CPU(s)
        System.out.println(" " + processor.getLogicalProcessorCount() + " logical CPU(s)");

    }

    /**
     * 打印内存相关信息的方法，包括可用内存、总内存、交换空间已使用量和总量等信息，并进行格式化输出
     *
     * @param memory 全局内存对象，包含了系统内存相关的详细信息
     */
    private static void printMemory(GlobalMemory memory) {
        // 格式化输出可用内存和总内存信息，单位通过FormatUtil工具类进行转换显示 5.1 GiB/15.4 GiB
        System.out.println("Memory: " + FormatUtil.formatBytes(memory.getAvailable()) + "/"
                + FormatUtil.formatBytes(memory.getTotal()));
        // 格式化输出交换空间已使用量和总量信息，单位通过FormatUtil工具类进行转换显示 13.1 GiB/15.4 GiB
        System.out.println("Swap used: " + FormatUtil.formatBytes(memory.getVirtualMemory().getSwapUsed()) + "/"
                + FormatUtil.formatBytes(memory.getVirtualMemory().getSwapTotal()));
    }


    /**
     * 打印系统进程相关信息的方法，包括进程数量、线程数量以及按照CPU使用率排序后的部分进程详细信息（如PID、CPU使用率、内存使用率、虚拟内存大小、实际内存大小、进程名称等）
     *
     * @param os 操作系统对象，用于获取进程相关信息
     * @param memory 全局内存对象，用于辅助计算内存使用率等信息
     */
    public static List<JSONObject> getProcesses(OperatingSystem os, GlobalMemory memory) {
        // 输出系统中进程的数量以及线程的数量 Processes: 330, Threads: 5993
        System.out.println("Processes: " + os.getProcessCount() + ", Threads: " + os.getThreadCount());

        // 定义按照CPU使用率从高到低排序的比较器
        Comparator<OSProcess> cpuUsageComparator = (p1, p2) -> {
            double cpuUsage1 = 100d * (p1.getKernelTime() + p1.getUserTime()) / p1.getUpTime();
            double cpuUsage2 = 100d * (p2.getKernelTime() + p2.getUserTime()) / p2.getUpTime();
            return Double.compare(cpuUsage2, cpuUsage1); // 按照CPU使用率从高到低排序，所以交换参数顺序
        };
        // 调用getProcesses方法获取全部进程，传入null表示不进行筛选，传入自定义的比较器用于排序，传入0表示返回所有满足条件（这里无筛选条件）的进程
        List<OSProcess> procs = os.getProcesses(null, cpuUsageComparator, 0);

        // 遍历并输出部分进程的详细信息（最多输出前5个进程，以避免输出过多信息）
        List<JSONObject>  powerSourcesObjList = new ArrayList<>();
        for (int i = 0; i < procs.size() && i < 50; i++) {
            JSONObject powerSourcesObject=new JSONObject();
            OSProcess p = procs.get(i);
            powerSourcesObject.put("PID",String.format("%5d",p.getProcessID()));
            powerSourcesObject.put("%CPU",String.format("%5.1f",100d * (p.getKernelTime() + p.getUserTime()) / p.getUpTime()));
            powerSourcesObject.put("%MEM",String.format("%4.1f",100d * p.getResidentSetSize() / memory.getTotal()));
            powerSourcesObject.put("VSZ",String.format("%9s",FormatUtil.formatBytes(p.getVirtualSize())));
            powerSourcesObject.put("RSS",String.format("%9s",FormatUtil.formatBytes(p.getResidentSetSize())));
            powerSourcesObject.put("Name",String.format("%s%n",p.getName()));
            powerSourcesObjList.add(powerSourcesObject);
        }
        return powerSourcesObjList;
    }

    /**
     * 打印电源相关信息的方法，包括电源剩余电量、充电状态以及各电源相关详细信息等内容
     *
     * @param list 电源源列表，包含了系统中所有电源相关的详细信息
     */
    private static void printPowerSources(List<PowerSource> list) {
        StringBuilder sb = new StringBuilder("Power: ");

        // 遍历每个电源，输出电源名称以及剩余电量百分比信息
        for (PowerSource pSource : list) {
//            System Battery @ 100.0%
            sb.append(String.format("%n %s @ %.1f%%", pSource.getName(), pSource.getRemainingCapacityPercent() * 100d));
        }
    }

    // 以下是各个私有方法的注释，这些方法主要用于格式化输出不同硬件或软件相关部分的详细信息

    /**
     * 打印磁盘相关信息的方法，包括磁盘名称、型号、序列号、读写情况、大小以及分区等详细信息
     *
     * @param list 磁盘存储列表，包含了系统中所有磁盘的详细信息
     */
    public static void printDisks(List<HWDiskStore> list) {
        System.out.println("Disks:");
        // 遍历每个磁盘对象
        for (HWDiskStore disk : list) {
            // 判断磁盘是否有读写操作，只要有读操作或者写操作，就认为该磁盘有读写活动
            boolean readwrite = disk.getReads() > 0 || disk.getWrites() > 0;
            // 格式化输出磁盘的相关信息，如名称、型号、序列号、大小、读写次数及字节数、传输时间等
            // 如果磁盘大小大于0，则格式化输出其大小（使用FormatUtil工具类进行格式化），否则输出 "?"
            System.out.format(" %s: (model: %s - S/N: %s) size: %s, reads: %s (%s), writes: %s (%s), xfer: %s ms%n",
                    disk.getName(), disk.getModel(), disk.getSerial(),
                    disk.getSize() > 0? FormatUtil.formatBytesDecimal(disk.getSize()) : "?",
                    readwrite? disk.getReads() : "?", readwrite? FormatUtil.formatBytes(disk.getReadBytes()) : "?",
                    readwrite? disk.getWrites() : "?", readwrite? FormatUtil.formatBytes(disk.getWriteBytes()) : "?",
                    readwrite? disk.getTransferTime() : "?");

            // 获取磁盘的分区列表
            List<HWPartition> partitions = disk.getPartitions();
            // 如果分区列表为空（可能某些操作系统尚未完全实现相关功能），则跳过当前磁盘的分区信息输出，继续下一个磁盘的处理
            if (partitions == null) {
                // TODO Remove when all OS's implemented
                continue;
            }
            // 遍历磁盘的每个分区，输出分区的详细信息，如标识、名称、类型、主次设备号、大小以及挂载点等
            for (HWPartition part : partitions) {
                System.out.format(" |-- %s: %s (%s) Maj:Min=%d:%d, size: %s%s%n", part.getIdentification(),
                        part.getName(), part.getType(), part.getMajor(), part.getMinor(),
                        FormatUtil.formatBytesDecimal(part.getSize()),
                        part.getMountPoint().isEmpty()? "" : " @ " + part.getMountPoint());
            }
        }
    }

    /**
     * 打印文件系统相关信息的方法，包括文件描述符使用情况以及各个文件存储的详细信息（如名称、描述、类型、可用空间、总空间、使用率、卷名、逻辑卷名、挂载点等）
     *
     * @param fileSystem 文件系统对象，包含了系统文件系统相关的详细信息
     */
    public static List<JSONObject> getFileSystem(FileSystem fileSystem) {
        // 输出文件系统中已打开的文件描述符数量和最大文件描述符数量
        System.out.format(" File Descriptors: %d/%d%n", fileSystem.getOpenFileDescriptors(),
                fileSystem.getMaxFileDescriptors());
        List<JSONObject> fileSystemObjList=new ArrayList<>();

        // 获取文件系统中的文件存储列表
        List<OSFileStore> fsArray = fileSystem.getFileStores();
        // 遍历每个文件存储，输出其详细信息
        for (OSFileStore fs : fsArray) {
            JSONObject fileSystemObject=new JSONObject();
            // 获取文件存储的可用空间大小
            long usable = fs.getUsableSpace();
            // 获取文件存储的总空间大小
            long total = fs.getTotalSpace();

            fileSystemObject.put("name", fs.getName());
            fileSystemObject.put("description", fs.getDescription().isEmpty()? "file system" : fs.getDescription());
            fileSystemObject.put("type", fs.getType());
            fileSystemObject.put("usable_space", FormatUtil.formatBytes(usable));
            fileSystemObject.put("total_space", FormatUtil.formatBytes(total));
            fileSystemObject.put("usage",String.format("%.2f", 100d * usable / total)+"%");
            fileSystemObjList.add(fileSystemObject);
        }
        return fileSystemObjList;
    }

    /**
     * 打印网络接口相关信息的方法，包括网络接口名称、显示名称、MAC地址、MTU、速度、IPv4和IPv6地址以及收发流量等详细信息
     *
     * @param list 网络接口列表，包含了系统中所有网络接口的详细信息
     */
    private static void printNetworkInterfaces(List<NetworkIF> list) {
        System.out.println("Network interfaces:");
        // 遍历每个网络接口对象
        for (NetworkIF net : list) {
            // 输出网络接口的名称和显示名称（通常显示名称更友好，便于用户查看）
            System.out.format(" Name: %s (%s)%n", net.getName(), net.getDisplayName());
            // 输出网络接口的MAC地址
            System.out.format("   MAC Address: %s %n", net.getMacaddr());
            // 输出网络接口的最大传输单元（MTU）以及速度（使用FormatUtil工具类格式化速度单位为 "bps"）
            System.out.format("   MTU: %s, Speed: %s %n", net.getMTU(), FormatUtil.formatValue(net.getSpeed(), "bps"));
            // 输出网络接口的IPv4地址数组（转换为字符串形式输出）
            System.out.format("   IPv4: %s %n", Arrays.toString(net.getIPv4addr()));
            // 输出网络接口的IPv6地址数组（转换为字符串形式输出）
            System.out.format("   IPv6: %s %n", Arrays.toString(net.getIPv6addr()));

            // 判断网络接口是否有数据收发活动（只要有接收或发送的字节数、数据包数大于0即可）
            boolean hasData = net.getBytesRecv() > 0 || net.getBytesSent() > 0 || net.getPacketsRecv() > 0
                    || net.getPacketsSent() > 0;
            // 格式化输出网络接口的流量信息，包括接收和发送的数据包数量、字节数以及错误数量（如果有数据活动则输出具体信息，否则输出 "?"）
            System.out.format("   Traffic: received %s/%s%s; transmitted %s/%s%s %n",
                    hasData? net.getPacketsRecv() + " packets" : "?",
                    hasData? FormatUtil.formatBytes(net.getBytesRecv()) : "?",
                    hasData? " (" + net.getInErrors() + " err)" : "",
                    hasData? net.getPacketsSent() + " packets" : "?",
                    hasData? FormatUtil.formatBytes(net.getBytesSent()) : "?",
                    hasData? " (" + net.getOutErrors() + " err)" : "");
        }
    }

    /**
     * 打印网络参数相关信息的方法，包括主机名、域名、DNS服务器、IPv4网关和IPv6网关等信息
     *
     * @param networkParams 网络参数对象，包含了系统网络相关的基础参数信息
     */
    private static void printNetworkParameters(NetworkParams networkParams) {
        // Host name: LVSHIHAO
        // Domain name: lvshihao
        // DNS servers: [192.168.0.1]
        // IPv4 Gateway: 192.168.0.1
        // IPv6 Gateway:
        System.out.println("Network parameters:");
        // 输出主机名
        System.out.format(" Host name: %s%n", networkParams.getHostName());
        // 输出域名
        System.out.format(" Domain name: %s%n", networkParams.getDomainName());
        // 输出DNS服务器地址数组（转换为字符串形式输出）
        System.out.format(" DNS servers: %s%n", Arrays.toString(networkParams.getDnsServers()));
        // 输出IPv4默认网关地址
        System.out.format(" IPv4 Gateway: %s%n", networkParams.getIpv4DefaultGateway());
        // 输出IPv6默认网关地址
        System.out.format(" IPv6 Gateway: %s%n", networkParams.getIpv6DefaultGateway());
    }

}
