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
//		�����������õ����������󶨣�
		InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("bean.xml");
//		����SAXReader�õ��ĵ�����
		SAXReader sax = new SAXReader();
		try {
			document = sax.read(in);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	public static Object getBean(String beanId) {
		Object object = null;
//		�����ĵ������е�selectSingleNode�����õ��ڵ���󣨸�ʽ��beans/bean[@id='"+beanId+"']��
		Node node = document.selectSingleNode("beans/bean[@id='"+beanId+"']");
//		���ڵ����תΪԪ�ض���
		Element ele = (Element) node;
//		�õ���classԪ���е�valueֵ
		String clazz = ele.attributeValue("class");
		try {
//			���õ���valueֵͨ�������������Class����
			Class<?> name = Class.forName(clazz);
//			����Class����õ������Ĺ�����
			Constructor<?> constructor = name.getConstructor();
//			ͨ��newInstance�����������������
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
