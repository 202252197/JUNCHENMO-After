package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.jcm.system.service.SysSystemMonitorService;
import lombok.AllArgsConstructor;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.CentralProcessor.TickType;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.OperatingSystem;
import oshi.util.FormatUtil;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.MemoryUsage;
import java.lang.management.RuntimeMXBean;
import java.text.DecimalFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Properties;
import java.util.concurrent.CompletableFuture;

import static com.jcm.common.core.utils.system.OshiUtil.getFileSystem;
import static com.jcm.common.core.utils.system.OshiUtil.getProcesses;

@AllArgsConstructor
@Service
public class SysSystemMonitorServiceImpl implements SysSystemMonitorService {

    private final TaskExecutor taskExecutor;
    @Override
    public Properties getSystemBaseInfo() {
        long startTime = System.currentTimeMillis();
        Properties info=new Properties();
        SystemInfo si = new SystemInfo();
        // 获取操作系统实例，用于访问操作系统相关信息
        OperatingSystem os = si.getOperatingSystem();
        // 获取硬件抽象层实例，用于访问硬件相关信息
        HardwareAbstractionLayer hal = si.getHardware();
        CompletableFuture<Void> cpu = CompletableFuture.runAsync(() -> {
            //cpu信息
            info.put("cpu", getCpuInfo(si));
        },taskExecutor);
        CompletableFuture<Void> memory = CompletableFuture.runAsync(() -> {
            //系统内存
            info.put("memory", getMemoryInfo(si));
        },taskExecutor);
        CompletableFuture<Void> jvmMemory = CompletableFuture.runAsync(() -> {
            //jvm内存
            info.put("jvmMemory", getJvmMemoryInfo(si));
        },taskExecutor);
         CompletableFuture<Void> server = CompletableFuture.runAsync(() -> {
            //服务器信息
            info.put("server",getServerInfo(si));
        },taskExecutor);
        CompletableFuture<Void> processes = CompletableFuture.runAsync(() -> {
             //获取进程
            info.put("processes",getProcesses(os,hal.getMemory()));
        },taskExecutor);
        CompletableFuture<Void> fileSystem = CompletableFuture.runAsync(() -> {
            //获取文件系统
            info.put("fileSystem",getFileSystem(os.getFileSystem()));
        },taskExecutor);
        CompletableFuture.allOf(cpu,memory,jvmMemory,server,processes,fileSystem).join();

        long endTime = System.currentTimeMillis();
        System.out.println("完成"+(endTime-startTime));
        return info;
    }

    /**
     * 获取系统Cpu信息
     * @param si
     * @return
     */
    private static JSONObject getCpuInfo(SystemInfo si){
        JSONObject cpuInfo = new JSONObject();
        // 获取CPU信息
        CentralProcessor cpu = si.getHardware().getProcessor();
        cpuInfo.put("Cpu核心数量:  ",cpu.getPhysicalProcessorCount());
        CentralProcessor processor = si.getHardware().getProcessor();
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        try {
            // 等待一段时间，例如1秒，以获取CPU使用率变化
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long[] ticks = processor.getSystemCpuLoadTicks();
        long user = ticks[CentralProcessor.TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long nice = ticks[TickType.NICE.getIndex()] - prevTicks[TickType.NICE.getIndex()];
        long sys = ticks[TickType.SYSTEM.getIndex()] - prevTicks[TickType.SYSTEM.getIndex()];
        long idle = ticks[TickType.IDLE.getIndex()] - prevTicks[TickType.IDLE.getIndex()];
        long iowait = ticks[TickType.IOWAIT.getIndex()] - prevTicks[TickType.IOWAIT.getIndex()];
        long irq = ticks[TickType.IRQ.getIndex()] - prevTicks[TickType.IRQ.getIndex()];
        long softirq = ticks[TickType.SOFTIRQ.getIndex()] - prevTicks[TickType.SOFTIRQ.getIndex()];
        long steal = ticks[TickType.STEAL.getIndex()] - prevTicks[TickType.STEAL.getIndex()];
        long totalCpu = user + nice + sys + idle + iowait + irq + softirq + steal;

        // 计算用户使用率，保留小数点后两位
        double userUsage = ((double) user / totalCpu) * 100;
        DecimalFormat userFormat = new DecimalFormat("#.##");
        cpuInfo.put("用户使用率: ", userFormat.format(userUsage) + "%");

        // 计算系统使用率，保留小数点后两位
        double sysUsage;
        if (totalCpu == 0) {
            // 处理总CPU时间为0的情况，这里将使用率设为0
            sysUsage = 0;
        } else {
            sysUsage = ((double) sys / totalCpu) * 100;
        }
        DecimalFormat sysFormat = new DecimalFormat("#.##");
        cpuInfo.put("系统使用率: ", sysFormat.format(sysUsage) + "%");

        // 计算当前空闲率，保留小数点后两位
        double idleRate = ((double) idle / totalCpu) * 100;
        DecimalFormat idleFormat = new DecimalFormat("#.##");
        cpuInfo.put("当前空闲率: ", idleFormat.format(idleRate) + "%");
        return cpuInfo;
    }

    /**
     * 获取系统内存信息
     * @param si
     * @return
     */
    private static JSONObject getMemoryInfo(SystemInfo si){
        JSONObject memoryInfo = new JSONObject();
        // 获取内存信息
        GlobalMemory memory = si.getHardware().getMemory();
        long pageSize = memory.getPageSize();
        memoryInfo.put("内存页面大小: " , FormatUtil.formatBytes(pageSize));
        // 将字节转换为MB（1MB = 1024 * 1024字节）
        long totalMemoryInMB = memory.getTotal() / (1024 * 1024);
        long availableMemoryInMB = memory.getAvailable() / (1024 * 1024);

        // 计算内存使用率，保留小数点后2位
        double memoryUsageRate = ((double) (memory.getTotal() - memory.getAvailable()) / memory.getTotal()) * 100;
        DecimalFormat df = new DecimalFormat("#.##");

        memoryInfo.put("系统总内存: ", totalMemoryInMB + "MB");
        memoryInfo.put("系统已用内存: ", availableMemoryInMB + "MB");
        memoryInfo.put("系统内存使用率: ", df.format(memoryUsageRate) + "%");

        return memoryInfo;
    }


    /**
     * 获取jvm内存信息
     * @param si
     * @return
     */
    private static JSONObject getJvmMemoryInfo(SystemInfo si)  {
        JSONObject jvmMemoryInfo = new JSONObject();
        MemoryMXBean memoryMXBean = ManagementFactory.getMemoryMXBean();
        // 获取RuntimeMXBean实例
        RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
        // 获取JVM启动时间（以毫秒为单位，从1970年1月1日00:00:00 UTC开始到JVM启动时刻的时间差）
        long startTimeInMillis = runtimeMXBean.getStartTime();
        // 获取当前时间（以毫秒为单位，从1970年1月1日00:00:00 UTC开始到当前时刻的时间差）
        long currentTimeInMillis = System.currentTimeMillis();

        // 将时长转换为更易读的格式，先转换为Duration对象
        Instant startInstant = Instant.ofEpochMilli(startTimeInMillis);
        Instant currentInstant = Instant.ofEpochMilli(currentTimeInMillis);
        Duration duration = Duration.between(startInstant, currentInstant);

        // 计算天数，通过总毫秒数除以一天包含的毫秒数（24 * 60 * 60 * 1000）
        long days = duration.toMillis() / (24 * 60 * 60 * 1000);
        long remainingMillis = duration.toMillis() % (24 * 60 * 60 * 1000);
        long hours = remainingMillis / (60 * 60 * 1000);
        long minutes = (remainingMillis / (60 * 1000)) % 60;
        long seconds = (remainingMillis / 1000) % 60;
        jvmMemoryInfo.put("JVM启动时长：", days + "天 " + hours + "小时 " + minutes + "分钟 " + seconds + "秒");

        MemoryUsage heapMemoryUsage = memoryMXBean.getHeapMemoryUsage();

        // 将JVM堆内存总大小从字节转换为MB（1MB = 1024 * 1024字节）
        long jvmTotalHeapMemoryInMB = heapMemoryUsage.getMax() / (1024 * 1024);
        // 将JVM堆内存已使用大小从字节转换为MB
        long jvmUsedHeapMemoryInMB = heapMemoryUsage.getUsed() / (1024 * 1024);

        // 计算JVM堆内存使用率，保留小数点后2位
        double jvmHeapMemoryUsageRate = ((double) heapMemoryUsage.getUsed() / heapMemoryUsage.getMax()) * 100;
        DecimalFormat df = new DecimalFormat("#.##");

        jvmMemoryInfo.put("JVM堆内存总大小: ", jvmTotalHeapMemoryInMB + "MB");
        jvmMemoryInfo.put("JVM堆内存已使用大小: ", jvmUsedHeapMemoryInMB + "MB");
        jvmMemoryInfo.put("JVM堆内存使用率: ", df.format(jvmHeapMemoryUsageRate) + "%");

        return jvmMemoryInfo;
    }

    /**
     * 获取服务器信息
     * @param si
     * @return
     */
    private static JSONObject getServerInfo(SystemInfo si) {
        JSONObject serverInfo = new JSONObject();
        // 获取操作系统相关信息
        OperatingSystem os = si.getOperatingSystem();
        // 获取服务器名称
        String hostname = os.getNetworkParams().getHostName();
        String ipv4DefaultGateway = os.getNetworkParams().getIpv4DefaultGateway();

        // 获取操作系统和系统架构信息
        String osName = os.toString();
        if (osName.length() > 25) {
            osName = osName.substring(0, 25) + "...";
        }
        String osArch = os.getBitness() + "位";
        // 创建一个Map或JSONObject来存储信息（这里使用Map，你可以根据需要转换为JSONObject）
        serverInfo.put("服务器名称: ", hostname);
        serverInfo.put("服务器IP: ", ipv4DefaultGateway);
        serverInfo.put("操作系统: ", osName);
        serverInfo.put("系统架构: ", osArch);
        // 打印服务器信息
        return serverInfo;
    }

    /**
     * 获取Java虚拟机信息
     * @param sigar
     * @return
     * @throws SigarException
     */
//    private static JSONObject getJavaInfo(Sigar sigar) throws SigarException {
//        // 获取Java名称（通过Java系统属性）
//        String javaName = System.getProperty("java.vm.name");
//        System.out.println("Java名称: " + javaName);
//
//        // 获取Java版本（通过Java系统属性）
//        String javaVersion = System.getProperty("java.version");
//        System.out.println("Java版本: " + javaVersion);
//
//        // 获取Java启动时间及运行时长
//        RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
//        long startTime = runtimeMXBean.getStartTime();
//        long uptime = runtimeMXBean.getUptime();
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date startDate = new Date(startTime);
//        System.out.println("启动时间: " + sdf.format(startDate));
//
//        long hours = uptime / (1000 * 60 * 60);
//        long minutes = (uptime / (1000 * 60)) % 60;
//        long seconds = (uptime / 1000) % 60;
//        System.out.println("运行时长: " + hours + "小时 " + minutes + "分钟 " + seconds + "秒");
//
//        // 获取Java安装路径（通过Java系统属性，可能在不同环境下不太准确）
//        String javaHome = System.getProperty("java.home");
//        System.out.println("安装路径: " + javaHome);
//
//        // 获取项目路径（较难准确获取，这里获取当前工作目录作为近似，不一定完全符合预期）
//        String projectPath = System.getProperty("user.dir");
//        System.out.println("项目路径: " + projectPath);
//
//        // 获取运行参数（通过RuntimeMXBean）
//        String argsStr = String.join(", ", runtimeMXBean.getInputArguments());
//        System.out.println("运行参数: " + argsStr);
//
//        try {
//            // Sigar相关资源释放（如果不使用了建议关闭）
//            sigar.close();
//        } catch (SigarException e) {
//            e.printStackTrace();
//        }
//        serverInfo.put("服务器名称: ", hostname);
//        serverInfo.put("操作系统: ", os.getDescription());
//        serverInfo.put("系统架构: ", os.getArch());
//        return serverInfo;
//    }

}
