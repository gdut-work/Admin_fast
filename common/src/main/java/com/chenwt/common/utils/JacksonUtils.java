package com.chenwt.common.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

/**
 * @class：JacksonUtils
 * @campany：zkzj
 * @author:chenwt
 * @date:2019-04-11 19:02
 * @description:
 */
public class JacksonUtils {
    private static ObjectMapper mapper = new ObjectMapper();

    /**
     * 对象转化
     *
     * @param json
     * @param beanType
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> T jsonToBean(String json, Class<T> beanType) {
        try {
            T bean = mapper.readValue(json, new TypeReference<T>() {
            });
            return bean;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 对象转化
     *
     * @param jsonData
     * @param valueTypeRef
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> T jsonToBean(String jsonData, TypeReference<T> valueTypeRef) {
        try {
            T bean = mapper.readValue(jsonData, valueTypeRef);
            return bean;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 将对象转换成json字符串。
     */
    public static String objectToJson(Object data) {
        try {
            String string = mapper.writeValueAsString(data);
            return string;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json数据转换成pojo对象list
     */
    public static <T, beanType> List<T> jsonToList(String jsonData, Class<T> beanType) {
        try {
            return mapper.readValue(jsonData, new TypeReference<List<beanType>>() {
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
