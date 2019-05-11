package com.chenwt.devtools.generate.utils.parser;

import com.chenwt.common.utils.ToolUtil;
import com.chenwt.devtools.generate.utils.CodeUtil;
import com.chenwt.devtools.generate.utils.FileUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 代码生成：xml解析工具
 * @author chenwt
 * @date 2019/3/1
 */
public class XmlParseUtil {

    // 字符编码
    private static final String encode = CodeUtil.encode;
    // 业务模块名称
    private static final String moduleName = "modules";
    // 缩进字符单位
    private static final int indentAmount = 4;
    // 换行字符跟随系统
    private static final String lineBreak = CodeUtil.lineBreak;
    // 文档类型
    private static String docType = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + lineBreak;
    // modules模块pom文件路径
    private static final String pomPath = String.format("%s/%s/pom.xml", ToolUtil.getProjectPath(), moduleName);

    /**
     * 获取Jsoup文档对象
     * @param path 文件路径
     */
    public static Document document(String path) throws IOException {
        InputStream inputStream = new FileInputStream(path);
        Document document = Jsoup.parse(inputStream, CodeUtil.encode, "", Parser.xmlParser());
        Document.OutputSettings outputSettings = document.outputSettings();
        outputSettings.prettyPrint(false);
        return document;
    }

    /**
     * 获取文档内容
     * @param document Jsoup文档对象
     */
    public static String html(Document document){
        Element project = document.getElementsByTag("project").get(0);
        StringBuilder html = new StringBuilder(docType + "<project");
        List<Attribute> pAttrs = project.attributes().asList();
        for (int i = 0; i < pAttrs.size(); i++) {
            if(i == 0){
                html.append(" ");
            }else{
                html.append(lineBreak).append(CodeUtil.blank(9));
            }
            html.append(pAttrs.get(i).getKey()).append("=\"").append(pAttrs.get(i).getValue()).append("\"");
        }
        html.append(">").append(project.html()).append("</project>");
        return html.toString();
    }

    /**
     * 获取pom文件modules节点
     */
    private static Element getPomModules(){
        try {
            return document(pomPath).getElementsByTag("modules").get(0);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 向pom文件中添加Maven模块名称
     */
    public static void addPomModule(String moduleName){
        Element modules = getPomModules();
        assert modules != null;
        Document document = modules.ownerDocument();
        StringBuilder indenx = new StringBuilder();
        for (int i = 0; i < indentAmount; i++) {
            indenx.append(" ");
        }
        modules.append(indenx + "<module>"+moduleName+"</module>" + lineBreak + indenx);
        FileUtil.saveWriter(new File(pomPath), html(document));
    }

    /**
     * 获取pom文件Module列表
     */
    public static List<String> getPomModuleList(){
        Element modules = getPomModules();
        assert modules != null;
        Elements moduleList = modules.getElementsByTag("module");
        List<String> list = new ArrayList<>();
        moduleList.forEach(element -> list.add(element.text()));
        return list;
    }

    /**
     * 获取依赖模板
     */
    public static String getDependency(String moduleName){
        StringBuilder dependency = new StringBuilder();
        dependency.append(CodeUtil.blank(4)).append("<dependency>").append(lineBreak);
        dependency.append(CodeUtil.blank(12)).append("<groupId>com.chenwt.modules</groupId>").append(lineBreak);
        dependency.append(CodeUtil.blank(12)).append("<artifactId>").append(moduleName).append("</artifactId>").append(lineBreak);
        dependency.append(CodeUtil.blank(12)).append("<version>${project.version}</version>").append(lineBreak);
        dependency.append(CodeUtil.blank(8)).append("</dependency>");
        return dependency.toString();
    }
}
