package com.jcm.system.service;

import com.jcm.common.core.thread.JcmThreadPoolTaskExecutor;
import com.jcm.system.JcmSystemApplication;
import lombok.Getter;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CountDownLatch;

/**
 * sys用户服务测试
 *
 * @author junchenmo
 * @date 2025/01/19 10:02
 */
@SpringBootTest(classes = JcmSystemApplication.class)
@ExtendWith(SpringExtension.class) // 添加此行
class ISysUserServiceTest {
    static CountDownLatch countDownLatch = new CountDownLatch(50);
    @Autowired
    private ISysUserService sysUserService;
    @Autowired
    private JcmThreadPoolTaskExecutor jcmThreadPoolTaskExecutor;

    static void test() throws InterruptedException {
        Thread.sleep(1000);
    }

    static void test2() throws InterruptedException {
        Thread.sleep(3000);
    }

    static void test3() throws InterruptedException {
        Thread.sleep(6000);
    }

    @BeforeEach
    void setUp() {
    }

    @AfterEach
    void tearDown() {
    }

    @Test
    void insertUser() {
//        SysUser sysUser = new SysUser();
//        sysUser.setUsername("admin");
//        sysUser.setPassword("lvshihao");
//        sysUser.setNickname("nickname");
//        sysUser.setStatus(0);
//        int i = sysUserService.insertUser(sysUser);
//        assertEquals(1,i);
//        ThreadLocal<String> ces=new ThreadLocal();
//        ces.set("lvsshihao");

//        long startTime = System.currentTimeMillis();
//        try{
//            System.out.println("启动1");
//            for(int i=0;i<50;i++){
////                System.out.println(i+"Thread...");
//                jcmThreadPoolTaskExecutor.execute(new MyThread(i));
//            }
//            countDownLatch.await();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        long endTime = System.currentTimeMillis();
//
//        System.out.println("完成"+(endTime-startTime));

        long startTime = System.currentTimeMillis();
        CompletableFuture<Void> voidCompletableFuture2 = CompletableFuture.runAsync(() -> {
            try {
                test();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }, jcmThreadPoolTaskExecutor);

        CompletableFuture<Void> voidCompletableFuture1 = CompletableFuture.runAsync(() -> {
            try {
                test2();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }, jcmThreadPoolTaskExecutor);

        CompletableFuture<Void> voidCompletableFuture = CompletableFuture.runAsync(() -> {
            try {
                test3();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }, jcmThreadPoolTaskExecutor);
        CompletableFuture.allOf(voidCompletableFuture, voidCompletableFuture1, voidCompletableFuture2).join();

        long endTime = System.currentTimeMillis();
        System.out.println("完成" + (endTime - startTime));
    }

    static class MyThread implements Runnable {

        @Getter
        private Integer name;

        public MyThread(Integer name) {
            this.name = name;
        }

        @Override
        public void run() {
            try {
                Thread.sleep(1000);
                System.out.println(name + "Thread...");
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            } finally {
                countDownLatch.countDown();
            }
        }
    }
}