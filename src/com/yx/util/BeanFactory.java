package com.yx.util;

import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

public final class BeanFactory {
	private static Document document;
	static {
//		根据属性名得到输入流（绑定）
		InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("bean.xml");
//		利用SAXReader得到文档对象
		SAXReader sax = new SAXReader();
		try {
			document = sax.read(in);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	public static Object getBean(String beanId) {
		Object object = null;
//		利用文档对象中的selectSingleNode方法得到节点对象（格式：beans/bean[@id='"+beanId+"']）
		Node node = document.selectSingleNode("beans/bean[@id='"+beanId+"']");
//		将节点对象转为元素对象
		Element ele = (Element) node;
//		得到与class元素中的value值
		String clazz = ele.attributeValue("class");
		try {
//			将得到的value值通过反射机制生成Class对象
			Class<?> name = Class.forName(clazz);
//			根据Class对象得到这个类的构造器
			Constructor<?> constructor = name.getConstructor();
//			通过newInstance方法反向生成类对象
			object = constructor.newInstance();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return object;
	}
}
