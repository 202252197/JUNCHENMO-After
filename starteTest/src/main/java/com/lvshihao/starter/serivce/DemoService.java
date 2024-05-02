package com.lvshihao.starter.serivce;

/**
 * 描述：随便定义一个Service
 *
 * @Author shf
 * @Date 2019/5/7 21:59
 * @Version V1.0
 **/
public class DemoService {
    public String sayWhat;
    public String toWho;
    public DemoService(String sayWhat, String toWho){
        this.sayWhat = sayWhat;
        this.toWho = toWho;
    }
    public String say(){
        return this.sayWhat + "!  " + toWho;
    }
}