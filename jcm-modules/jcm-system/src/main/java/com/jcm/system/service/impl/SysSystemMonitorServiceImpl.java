package com.jcm.system.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.jcm.system.service.SysSystemMonitorService;
import lombok.AllArgsConstructor;
import org.hyperic.sigar.*;
import org.springframework.stereotype.Service;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.MemoryUsage;
import java.util.Properties;

@Service
@AllArgsConstructor
public class SysSystemMonitorServiceImpl implements SysSystemMonitorService {

    @Override
    public Properties getSystemBaseInfo() {
        Properties info=new Properties();
        Sigar sigar = new Sigar();
        try {
            //cpu信息
            JSONObject cpuInfo = new JSONObject();
            // 获取CPU核心数
            CpuInfo[] cpuInfoList = sigar.getCpuInfoList();
            cpuInfo.put("CPU核心数: ", cpuInfoList.length);
            // 获取CPU使用率
            CpuPerc[] cpuPercs = sigar.getCpuPercList();
            for (CpuPerc cpuPerc : cpuPercs) {
                cpuInfo.put("用户使用率: ", cpuPerc.getUser() * 100 + "%");
                cpuInfo.put("系统使用率: ", cpuPerc.getSys() * 100 + "%");
                cpuInfo.put("当前空闲率: ", cpuPerc.getIdle() * 100 + "%");
            }
            //系统内存
            JSONObject memoryInfo = new JSONObject();
            Mem mem = sigar.getMem();
            // 系统总内存（单位：字节）
            long totalMemory = mem.getTotal();
            // 系统已用内存（单位：字节）
            long usedMemory = mem.getUsed();
            // 系统内存使用率
            double memoryUsageRate = ((double) usedMemory / totalMemory) * 100;
            memoryInfo.put("系统总内存: ", totalMemory + "字节");
            memoryInfo.put("系统已用内存: ", usedMemory + "字节");
            memoryInfo.put("系统内存使用率: ", memoryUsageRate + "%");xs
            //jvm内存
            JSONObject jvmMemoryInfo = new JSONObject();
            MemoryMXBean memoryMXBean = ManagementFactory.getMemoryMXBean();
            MemoryUsage heapMemoryUsage = memoryMXBean.getHeapMemoryUsage();
            // JVM堆内存总大小（单位：字节）
            long jvmTotalHeapMemory = heapMemoryUsage.getMax();
            // JVM堆内存已使用大小（单位：字节）
            long jvmUsedHeapMemory = heapMemoryUsage.getUsed();
            // JVM堆内存使用率
            double jvmHeapMemoryUsageRate = ((double) jvmUsedHeapMemory / jvmTotalHeapMemory) * 100;
            jvmMemoryInfo.put("JVM堆内存总大小: ", jvmTotalHeapMemory + "字节");
            jvmMemoryInfo.put("JVM堆内存已使用大小: ", jvmUsedHeapMemory + "字节");
            jvmMemoryInfo.put("JVM堆内存使用率: ", jvmHeapMemoryUsageRate + "%");
            info.put("cpu", cpuInfo);
            info.put("memory", memoryInfo);
            info.put("jvmMemory", jvmMemoryInfo);
        } catch (SigarException e) {
            e.printStackTrace();
        }
        return null;
    }
}
