package com.chenwt.devtools.generate.utils.jAngel.nodes;

import com.chenwt.devtools.generate.utils.jAngel.JAngel;

/**
 * 字段或内部变量节点
 * @author chenwt
 * @date 2019/3/28
 */
public class FieldNode extends Modifier {

    // 节点值
    protected String value;

    public FieldNode(){
    }

    /**
     * 创建一个字段
     * @param name 节点名称
     */
    public FieldNode(String name){
        this.name = name;
    }

    /**
     * 创建一个字段
     * @param name 节点名称
     * @param classType 变量类型
     */
    public FieldNode(String name, Class<?> classType){
        this.name = name;
        this.type = classType.getSimpleName();
        importClass(classType);
    }

    /**
     * 创建一个字段
     * @param name 节点名称
     * @param classType 变量类型
     * @param value 值
     */
    public FieldNode(String name, Class<?> classType, String value){
        this.name = name;
        this.type = classType.getSimpleName();
        this.value = value;
        importClass(classType);
    }

    /**
     * 获取字段值
     */
    public String getValue() {
        return value;
    }

    /**
     * 设置字段值
     * @param value 字段值
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 设置字段值
     * @param format 参数版式
     */
    public void setValue(Format format) {
        imports.addAll(format.getImports());
        this.value = format.getContent();
    }

    @Override
    public String body() {
        if(body != null){
            return body;
        }
        StringBuilder builder = new StringBuilder();
        builder.append(getIndex()).append(getModifier()).append(name);
        if (value != null){
            builder.append(" = ").append(value);
        }
        builder.append(";").append(JAngel.lineBreak);
        return builder.toString();
    }
}
