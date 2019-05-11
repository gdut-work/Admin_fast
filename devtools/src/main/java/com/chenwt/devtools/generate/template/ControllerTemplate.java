package com.chenwt.devtools.generate.template;

import com.chenwt.common.enums.StatusEnum;
import com.chenwt.common.utils.EntityBeanUtil;
import com.chenwt.common.utils.ResultVoUtil;
import com.chenwt.common.utils.StatusUtil;
import com.chenwt.common.utils.ToolUtil;
import com.chenwt.common.vo.ResultVo;
import com.chenwt.devtools.generate.domain.Generate;
import com.chenwt.devtools.generate.enums.FieldQuery;
import com.chenwt.devtools.generate.enums.TierType;
import com.chenwt.devtools.generate.utils.CodeUtil;
import com.chenwt.devtools.generate.utils.FileUtil;
import com.chenwt.devtools.generate.utils.GenerateUtil;
import com.chenwt.devtools.generate.utils.jAngel.JAngelContainer;
import com.chenwt.devtools.generate.utils.jAngel.nodes.ClassNode;
import com.chenwt.devtools.generate.utils.jAngel.nodes.Document;
import com.chenwt.devtools.generate.utils.jAngel.nodes.FieldNode;
import com.chenwt.devtools.generate.utils.jAngel.nodes.Node;
import com.chenwt.devtools.generate.utils.jAngel.parser.Expression;
import com.chenwt.devtools.generate.utils.parser.JavaParseUtil;

import java.nio.file.FileAlreadyExistsException;
import java.util.Set;

/**
 * @author chenwt
 * @date 2018/10/24
 */
public class ControllerTemplate {

    /**
     * 生成需要导入的包
     */
    private static Set<String> genImports(Generate generate) {
        JAngelContainer container = new JAngelContainer();
        container.importClass(JavaParseUtil.getPackage(generate, TierType.DOMAIN));
        container.importClass(JavaParseUtil.getPackage(generate, TierType.SERVICE));
        container.importClass(JavaParseUtil.getPackage(generate, TierType.VALID));
        container.importClass(StatusEnum.class);
        container.importClass(EntityBeanUtil.class);
        container.importClass(ResultVoUtil.class);
        container.importClass(StatusUtil.class);
        container.importClass(ResultVo.class);
        return container.getImports();
    }

    /**
     * 生成类体
     */
    private static Document genClazzBody(Generate generate) {
        // 构建数据-模板表达式
        Expression expression = new Expression();
        expression.label("name", ToolUtil.lowerFirst(generate.getBasic().getTableEntity()));
        expression.label("entity", generate.getBasic().getTableEntity());
        expression.label("module", generate.getBasic().getGenModule());
        expression.label("requestMapping", generate.getBasic().getRequestMapping());
        expression.label("permissions", CodeUtil.urlToPerms(generate.getBasic().getRequestMapping()));
        String path = FileUtil.templatePath(ControllerTemplate.class);

        // 获取jAngel文档对象
        Document document = JavaParseUtil.document(path, expression, generate, TierType.CONTROLLER);
        document.getContainer().importClass(genImports(generate));
        ClassNode clazz = document.getClazz();

        // 主页列表页面
        Node index = clazz.getChildByName("index");
        if (index != null) {
            if (!generate.getTemplate().isIndex()) {
                index.remove();
            }else {
                // 动态匹配器
                FieldNode matcher = (FieldNode) index.getChildByName("matcher");
                generate.getFields().forEach(field -> {
                    if(field.getQuery() != null && field.getQuery().equals(FieldQuery.Like.getCode())){
                        String with = ".withMatcher(\""+ field.getName() +"\", match -> match.contains())";
                        String value = matcher.getValue() + CodeUtil.lineBreak + CodeUtil.blank(16) + with;
                        matcher.setValue(value);
                    }
                });
            }
        }

        // 添加及编辑页面
        if (!generate.getTemplate().isAdd()) {
            Node toAdd = clazz.getChildByName("toAdd");
            Node toEdit = clazz.getChildByName("toEdit");
            Node save = clazz.getChildByName("save");
            if (toAdd != null) toAdd.remove();
            if (toEdit != null) toEdit.remove();
            if (save != null) save.remove();
        }

        // 详细页面
        if (!generate.getTemplate().isDetail()) {
            Node toDetail = clazz.getChildByName("toDetail");
            if (toDetail != null) toDetail.remove();
        }

        return document;
    }

    /**
     * 生成控制器模板
     */
    public static String generate(Generate generate) {
        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, TierType.CONTROLLER);
        try {
            Document document = genClazzBody(generate);
            GenerateUtil.generateFile(filePath, document.content());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
