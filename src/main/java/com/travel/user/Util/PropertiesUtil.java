package com.travel.user.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * ��ȡProperties�ۺ���,Ĭ�ϰ󶨵�classpath�µ�config.properties�ļ���
 * @author
 */
public class PropertiesUtil {
    //�����ļ���·��
    private String configPath=null;
    
    /**
     * �����ļ�����
     */
    private Properties props=null;
    
    /**
     * Ĭ�Ϲ��캯��������sh���У��Զ��ҵ�classpath�µ�config.properties��
     */
    public PropertiesUtil() throws IOException{
        InputStream in = PropertiesUtil.class.getClassLoader().getResourceAsStream("filePath.properties");
        props = new Properties();
        props.load(in);
        in.close();  //�ر���Դ
    }
    
    /**
     * ����keyֵ��ȡ���õ�ֵ
     * @author 
     * @param key keyֵ
     * @return key ����Ӧ��ֵ 
     * @throws IOException 
     */
    public String readValue(String key) throws IOException {
        return  props.getProperty(key);
    }
    
    /**
     * ��ȡproperties��ȫ����Ϣ
     * @throws FileNotFoundException �����ļ�û���ҵ�
     * @throws IOException �ر���Դ�ļ������߼��������ļ�����
     * 
     */
    public Map<String,String> readAllProperties() throws FileNotFoundException,IOException  {
        //�������еļ�ֵ
        Map<String,String> map=new HashMap<String,String>();
        @SuppressWarnings("rawtypes")
		Enumeration en = props.propertyNames();
        while (en.hasMoreElements()) {
            String key = (String) en.nextElement();
            String Property = props.getProperty(key);
            map.put(key, Property);
        }
        return map;
    }

    /**
     * ����ĳ��key��ֵ,���������ļ���
     * @param key keyֵ
     * @return key ����Ӧ��ֵ 
     * @throws IOException 
     */
    public void setValue(String key,String value) throws IOException {
        Properties prop = new Properties();
        InputStream fis = new FileInputStream(this.configPath);
        // ���������ж�ȡ�����б�����Ԫ�ضԣ�
        prop.load(fis);
        // ���� Hashtable �ķ��� put��ʹ�� getProperty �����ṩ�����ԡ�
        // ǿ��Ҫ��Ϊ���Եļ���ֵʹ���ַ���������ֵ�� Hashtable ���� put �Ľ����
        OutputStream fos = new FileOutputStream(this.configPath);
        prop.setProperty(key, value);
        // ���ʺ�ʹ�� load �������ص� Properties ���еĸ�ʽ��
        // ���� Properties ���е������б�����Ԫ�ضԣ�д�������
        prop.store(fos,"last update");
        //�ر��ļ�
        fis.close();
        fos.close();
    }
    
    public static void main(String[] args) {
        PropertiesUtil p;
        try {
            p = new PropertiesUtil();
            System.out.println(p.readAllProperties()+"````````");
            System.out.println((p.readAllProperties()).get("configModify")+"��·����");
            File file = new File((p.readAllProperties()).get("configModify"));
			if (!file.exists()) {//�ļ�������
					if (!file.exists()) {
						file.createNewFile();
						FileOutputStream out = new FileOutputStream(file);
						out.write("modify file".getBytes());
						out.close();
					}
				}
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}