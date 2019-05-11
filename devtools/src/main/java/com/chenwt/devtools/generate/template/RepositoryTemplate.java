package com.chenwt.devtools.generate.template;

import com.chenwt.devtools.generate.domain.Generate;
import com.chenwt.devtools.generate.enums.TierType;
import com.chenwt.devtools.generate.utils.FileUtil;
import com.chenwt.devtools.generate.utils.GenerateUtil;
import com.chenwt.devtools.generate.utils.jAngel.JAngelContainer;
import com.chenwt.devtools.generate.utils.jAngel.nodes.Document;
import com.chenwt.devtools.generate.utils.jAngel.parser.Expression;
import com.chenwt.devtools.generate.utils.parser.JavaParseUtil;
import com.chenwt.modules.system.repository.BaseRepository;

import java.nio.file.FileAlreadyExistsException;
import java.util.Set;

/**
 * @author chenwt
 * @date 2018/10/25
 */
public class RepositoryTemplate {

    /**
     * 生成需要导入的包
     */
    private static Set<String> genImports(Generate generate) {
        JAngelContainer container = new JAngelContainer();
        container.importClass(JavaParseUtil.getPackage(generate, TierType.DOMAIN));
        container.importClass(BaseRepository.class);
        return container.getImports();
    }

    /**
     * 生成类字段
     */
    private static Document genClazzBody(Generate generate) {
        // 构建数据-模板表达式
        Expression expression = new Expression();
        expression.label("entity", generate.getBasic().getTableEntity());
        String path = FileUtil.templatePath(RepositoryTemplate.class);

        // 获取jAngel文档对象
        Document document = JavaParseUtil.document(path, expression, generate, TierType.DAO);
        document.getContainer().importClass(genImports(generate));

        return document;
    }

    /**
     * 生成Dao层模板
     */
    public static String generate(Generate generate) {
        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, TierType.DAO);
        try {
            Document document = genClazzBody(generate);
            GenerateUtil.generateFile(filePath, document.content());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
