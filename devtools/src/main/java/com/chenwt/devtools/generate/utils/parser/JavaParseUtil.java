package com.chenwt.devtools.generate.utils.parser;

import com.chenwt.devtools.generate.domain.Generate;
import com.chenwt.devtools.generate.enums.ModuleType;
import com.chenwt.devtools.generate.enums.TierType;
import com.chenwt.devtools.generate.utils.CodeUtil;
import com.chenwt.devtools.generate.utils.jAngel.JAngel;
import com.chenwt.devtools.generate.utils.jAngel.nodes.ClassNode;
import com.chenwt.devtools.generate.utils.jAngel.nodes.Document;
import com.chenwt.devtools.generate.utils.jAngel.parser.Expression;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 代码生成：java解析工具
 * @author chenwt
 * @date 2019/4/4
 */
public class JavaParseUtil {

    /**
     * 获取jAngel文档对象
     * @param generate 生成数据对象
     * @param type 业务模块类型
     */
    public static Document document(Generate generate, TierType type){
        return document(null, null, generate, type);
    }

    /**
     * 获取jAngel文档对象
     * @param path 文件路径
     * @param expression 模板表达式
     * @param generate 生成数据对象
     * @param type 业务模块类型
     */
    public static Document document(String path, Expression expression, Generate generate, TierType type){
        // 获取jAngel文档对象
        Document document = null;
        String packageName = getPackage(generate, type);
        if (path != null){
            document = JAngel.parse(path, expression);
        }else {
            int last = packageName.lastIndexOf('.') + 1;
            document = JAngel.create(packageName.substring(last, packageName.length()));
        }
        document.setPackageName(packageName.substring(0, packageName.lastIndexOf('.')));
        ClassNode clazz = document.getClazz();

        // 作者信息
        String author = generate.getBasic().getAuthor();
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        String comments = "/**" + CodeUtil.lineBreak +
                " * @author " + author + CodeUtil.lineBreak +
                " * @date " + df.format(new Date()) + CodeUtil.lineBreak +
                " */";
        clazz.setComments(comments);

        return document;
    }

    /**
     * 生成包名路径
     * @param generate 生成数据对象
     * @param type 业务模块类型
     */
    public static String getPackage(Generate generate, TierType type){
        String packagePath = generate.getBasic().getPackagePath();
        String module = generate.getBasic().getGenModule();
        String entity = generate.getBasic().getTableEntity();
        String modules = "." + CodeUtil.modules + ".";
        String admin = "." + CodeUtil.admin + ".";
        if (!generate.getBasic().getModuleType().equals(ModuleType.ALONE.getCode())){
            modules = admin;
        }
        if (generate.getBasic().getGenGroup() != null){
            module += "." + generate.getBasic().getGenGroup();
        }
        switch (type){
            case DOMAIN:
                return packagePath + modules + module + ".domain." + entity;
            case DAO:
                return packagePath + modules + module + ".repository." + entity + "Repository";
            case SERVICE:
                return packagePath + modules + module + ".service." + entity + "Service";
            case SERVICE_IMPL:
                return packagePath + modules + module + ".service.impl." + entity + "ServiceImpl";
            case CONTROLLER:
                return packagePath + admin + module + ".controller." + entity + "Controller";
            case VALID:
                return packagePath + admin + module + ".validator." + entity + "Valid";
        }
        return "";
    }

}
