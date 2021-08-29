package com.yx.util;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public final class MyBeanFactory {

    private static BeanFactory bf;

    static {
        bf = new ClassPathXmlApplicationContext("bean.xml");
    }

    public static Object getBean(String beanId){
        return bf.getBean(beanId);
    }
}
