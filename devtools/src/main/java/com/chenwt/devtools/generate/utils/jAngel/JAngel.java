package com.chenwt.devtools.generate.utils.jAngel;

import com.chenwt.devtools.generate.utils.jAngel.nodes.ClassNode;
import com.chenwt.devtools.generate.utils.jAngel.nodes.Document;
import com.chenwt.devtools.generate.utils.jAngel.parser.Expression;
import com.chenwt.devtools.generate.utils.jAngel.parser.Parser;
import com.chenwt.devtools.generate.utils.jAngel.utils.StringUtil;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;

/**
 * @author chenwt
 * @date 2019/3/28
 */
public class JAngel {

    /* 默认值区域 */
    // 字符编码
    public static final String encode = "UTF-8";
    // 系统默认的换行符
    public static String lineBreak = System.getProperty("line.separator");
    // 制表符(缩进距离)
    public static String tabBreak = StringUtil.blank(4);

    /**
     * 新建一个java源码文档
     * @param clazzName 类名称
     * @return java源码文档
     */
    public static Document create(String clazzName){
        Document document = new Document();
        JAngelContainer container = new JAngelContainer();
        document.setContainer(container);
        ClassNode classNode = new ClassNode(clazzName);
        document.setClazz(classNode);
        return document;
    }

    /**
     * 解析java源码文件
     * @param path 文件路径
     * @return java源码文档
     */
    public static Document parse(String path){
        return parse(path, null);
    }

    /**
     * 解析java源码文件
     * @param path 文件路径
     * @param expression 模板表达式
     * @return java源码文档
     */
    public static Document parse(String path, Expression expression){
        FileInputStream fis = null;
        InputStreamReader isr = null;
        BufferedReader br = null;
        try {
            fis = new FileInputStream(URLDecoder.decode(path, encode));
            isr = new InputStreamReader(fis, encode);
            br = new BufferedReader(isr);
            String line = "";
            Parser parser = new Parser();
            while ((line = br.readLine()) != null){
                if (expression != null){
                    line = expression.matcher(line);
                }
                parser.line(line + lineBreak);
            }
            return parser.getDocument();
        } catch (IOException e) {
            try {
                if(fis != null) fis.close();
                if(isr != null) isr.close();
                if(br != null) br.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        return new Document();
    }

}
